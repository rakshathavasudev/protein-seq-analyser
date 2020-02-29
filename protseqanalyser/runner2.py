import os
from time import sleep
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'protseqanalyser.settings')
django.setup()

from secstructpred.models import SecondaryStructurePrediction

model_path = '/home/psa/VGST_Scripts/2-PSSP'


def main():
    print('Runner 2 executing.')
    while True:
        #print('Runner 5 awake.')
        obj = SecondaryStructurePrediction.objects.filter(completed=False).all()
        for job in obj:
            print(f'Processing {job.id} by Runner 2')
            with open('/home/psa/VGST_Scripts/HHBlits/Datasets/WebRequests/Input/2_' + str(job.id) + '.fasta', 'w') as f:
                f.write(job.sequence)
            # with open('/home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/Input/3_' + str(job.id) + '.fasta', 'w') as f:
            #     f.write(job.sequence)
            with open('/home/psa/VGST_Scripts/PSI-BLAST/Datasets/WebRequests/Input/2_' + str(job.id) + '.fasta', 'w') as f:
                f.write(job.sequence)
            exec_string = f'cd {model_path}; bash Execute_PSSP.sh 2_{job.id};'
            print('Executing',exec_string)
            os.system(exec_string)
            try:
                os.rename(os.path.join(model_path, 'Results', f'2_{job.id}.txt'), os.path.join(model_path, 'Results', f'{job.id}')) 
                # print('edie')
            except:
                pass
            job.completed = True
            job.save()
        # print('Runner 5 going to sleep')
        sleep(3)

if __name__ == '__main__':
    main()
