import os
from time import sleep
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'protseqanalyser.settings')
django.setup()

from secstructclasspred.models import SecondaryStructureClassPrediction

model_path = '/home/psa/VGST_Scripts/3-PSSCP'


def main():
    print('Runner 3 executing.')
    while True:
        #print('Runner 5 awake.')
        obj = SecondaryStructureClassPrediction.objects.filter(completed=False).all()
        for job in obj:
            print(f'Processing {job.id} by Runner 3')
            # with open('/home/psa/VGST_Scripts/HHBlits/Datasets/WebRequests/Input/4_' + str(job.id) + '.fasta', 'w') as f:
            #     f.write(job.sequence)
            with open('/home/psa/VGST_Scripts/PSIPRED/Datasets/WebRequests/Input/3_' + str(job.id) + '.fasta', 'w') as f:
                f.write(job.sequence)
            # with open('/home/psa/VGST_Scripts/PSI-BLAST/Datasets/WebRequests/Input/6_' + str(job.id) + '.fasta', 'w') as f:
            #     f.write(job.sequence)
            exec_string = f'cd {model_path}; bash Execute_PSSCP.sh 3_{job.id};'
            print('Executing',exec_string)
            os.system(exec_string)
            try:
                os.rename(os.path.join(model_path, 'Results', f'3_{job.id}.txt'), os.path.join(model_path, 'Results', f'{job.id}')) 
                # print('edie')
            except:
                pass
            job.completed = True
            job.save()
        # print('Runner 5 going to sleep')
        sleep(3)

if __name__ == '__main__':
    main()
