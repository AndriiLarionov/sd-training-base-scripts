# install Miniconda3
cd $HOME
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

source ~/miniconda3/bin/activate

conda create -n sd python=3.10.6 -y
conda activate sd
pip install fastapi==0.90.1
python -m pip install --upgrade pip