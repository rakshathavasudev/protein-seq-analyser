import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'protseqanalyser.settings')
django.setup()

from multiprotseqalign.models import ProteinSequence

model_path = 'multiprotseqalign/model'
output_path = 'multiprotseqalign/model/Output'

def main():
    print('Runner 1 executing.')
    files = os.listdir(os.path(output_path))
    for file in files:
        # complete auto file delete function after 1 day

    # while True:
    #     print('Runner 1 awake.')
    #     obj = ProteinSequence.objects.filter(completed=False).all()
    #     for job in obj:
    #         print(f'Processing {job.id} by Runner 1')
    #         with open(os.path.join(model_path, "Input", str(job.id)), 'w') as f:
    #             f.write(job.sequence)
    #         exec_string = f'cd {os.path.join(model_path, "src")}; java Main {job.id};'
    #         print('Executing',exec_string)
    #         os.system(exec_string)
    #         job.completed = True
    #         job.save()
    #     print('Runner 1 going to sleep')
    #     sleep(3)

if __name__ == '__main__':
    main()