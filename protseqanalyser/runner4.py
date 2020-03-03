import os
from time import sleep
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'protseqanalyser.settings')
django.setup()

from foldrecog.models import FoldRecognition 

model_path = '/home/psa/VGST_Scripts/4-PFR'


def main():
    print('Runner 4 executing.')
    while True:
        #print('Runner 5 awake.')
        obj = FoldRecognition.objects.filter(completed=False).all()
        for job in obj:
            print(f'Processing {job.id} by Runner 4')
            with open('/home/psa/VGST_Scripts/HHBlits/Datasets/WebRequests/Input/4_' + str(job.id) + '.fasta', 'w') as f:
                f.write(job.sequence)
            #  with open('/home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/Input/5_' + str(job.id) + '.fasta', 'w') as f:
            #     f.write(job.sequence)
            # with open('/home/psa/VGST_Scripts/PSI-BLAST/Datasets/WebRequests/Input/5_' + str(job.id) + '.fasta', 'w') as f:
            #     f.write(job.sequence)
            exec_string = f'cd {model_path}; bash Execute_PFR_DeepFold.sh 4_{job.id};'
            print('Executing',exec_string)
            os.system(exec_string)
            try:
                os.rename(os.path.join(model_path, 'Results', f'4_{job.id}.txt'), os.path.join(model_path, 'Results', f'{job.id}')) 
                # print('edie')
            except:
                pass
            job.completed = True
            job.save()
        # print('Runner 5 going to sleep')
        sleep(3)

if __name__ == '__main__':
    main()
