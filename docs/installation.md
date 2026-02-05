# AKShare Installation Guide

> This documentation is an English translation of the original [AKShare documentation](https://akshare.akfamily.xyz).
> The authoritative source for this project is the [AKShare GitHub repository](https://github.com/akfamily/akshare).

*Back to [original Chinese documentation →](https://akshare.akfamily.xyz/install.html)*

---

## Important Notes

1. Currently, [AKShare](https://github.com/akfamily/akshare) only supports installation and use on 64-bit operating systems.

2. Currently, [AKShare](https://github.com/akfamily/akshare) only supports [Python](https://www.python.org/) 3.8 (64-bit) and above. We recommend [Python](https://www.python.org/) 3.11.x (64-bit) version.

3. [AKShare](https://github.com/akfamily/akshare) recommends installing the latest version of [Anaconda (64-bit)](https://www.anaconda.com/), which can solve most environment configuration problems.

4. For users familiar with container technology, Docker can be installed and used. See the tutorial: [AKShare Docker Deployment](docker.md).

---

## Installing AKShare

### Standard Installation

```bash
pip install akshare --upgrade
```

**Note:** When running the program, the filename and folder name cannot be "akshare".

---

### China Installation - Python

For users in China, use the following command with Tsinghua mirror:

```bash
pip install akshare --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple
```

---

### China Installation - Anaconda

For Anaconda users in China:

```bash
pip install akshare --upgrade --user -i https://pypi.tuna.tsinghua.edu.cn/simple
```

---

## Upgrading AKShare

> **Note:** Due to frequent version updates, please upgrade before using [AKShare](https://github.com/akfamily/akshare):

```bash
pip install akshare --upgrade -i https://pypi.org/simple
```

---

## Apple Silicon (M-Series) Support

1. AKShare now natively supports Apple M-series chips. Simply use:

```bash
pip install akshare --upgrade
```

2. If compilation is required, please refer to: [Building V8 on an M1 MacBook](https://joyeecheung.github.io/blog/2021/08/27/binding-v8-on-an-m1-macbook/)

---

## Raspberry Pi Support

AKShare now supports installation and use on Raspberry Pi 4B. Installation method:

1. Install [Raspberry Pi OS (64-bit)](https://www.raspberrypi.com/software/operating-systems/) - currently supports the 64-bit version released on 20231010

2. Install virtual environment support:
```bash
sudo apt-get install python3-venv
```

3. Create a virtual environment named "myenv":
```bash
python3 -m venv myenv
```

4. Activate the virtual environment:
```bash
source myenv/bin/activate
```

5. Install AKShare:
```bash
pip install akshare --upgrade
```

---

## R Language Support

### Installing Anaconda

Download and install [Anaconda](https://www.anaconda.com/) for your operating system.

---

### Installing R Language

Install [R](https://www.r-project.org/) for your operating system.

---

### Upgrading R Language to Latest Version

**Windows:**
1. Open RGui as administrator
2. Run: `install.packages("installr")`
3. Run: `installr::updateR()`

**Mac:**
1. Install [XQuartz](https://www.xquartz.org/)
2. Run the following in terminal:
```bash
# Add Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add R Homebrew tap
brew tap homebrew/core

# Install R
brew install r
```

---

### Installing R Packages

1. Install the Anaconda environment first
2. Open R in the Anaconda environment
3. Install the following packages:
```r
install.packages("reticulate")
install.packages("httr")
install.packages("jsonlite")
```

4. Configure Python path in R:
```r
library(reticulate)
use_python("/your/path/to/anaconda3/bin/python", required = TRUE)
```

---

### MATLAB Support

#### Installing Anaconda

Download and install [Anaconda](https://www.anaconda.com/) for your operating system.

---

#### Installing MATLAB

Download and install [MATLAB](https://www.mathworks.com/products/matlab.html) for your operating system.

---

#### Configuring Environment

1. Open Anaconda Prompt (Windows) or Terminal (Mac/Linux)
2. Create a new environment:
```bash
conda create -n akshare python=3.11
conda activate akshare
pip install akshare
```

3. Open MATLAB and configure Python:
```matlab
pyenv(Version="/your/path/to/anaconda3/envs/akshare/bin/python", ExecutionMode=1);
```

##### Testing Environment Configuration

```matlab
% Test Python environment
py.print("Hello, AKShare from MATLAB!");
```

##### Testing AKShare Interface Calls

```matlab
% Test without parameters
data = py.akshare.stock_market_summary();
disp(data);

% Test with parameters
data = py.akshare.stock_fundamental_flow(pyargs("symbol","600519","period","annual"));
disp(data);
```

##### Converting Data Formats

```matlab
% Convert to table
data_table = table(data.Values, 'VariableNames', data.Properties.RowNames);

% Export to CSV
writetable(data_table, 'akshare_data.csv');
```

---

## Troubleshooting Installation Errors

### 1. Installation Timeout Error

This is usually caused by slow network or timeout when downloading packages.

**Solution:**
- Use China mirror source: `pip install akshare -i https://pypi.tuna.tsinghua.edu.cn/simple`
- Increase timeout: `pip install akshare --default-timeout=100`

### 2. Permission Denied Error

**Solution:**
- Use user installation: `pip install akshare --user`
- Use virtual environment

### 3. Other Errors

If you encounter other errors:

1. Check Python version: `python --version` (must be 3.8+)
2. Check system architecture: Must be 64-bit
3. Update pip: `pip install --upgrade pip`
4. Install Visual C++ Build Tools (Windows)

---

## See Also

- [Introduction](introduction.md) - Project overview
- [Quick Start](tutorial.md) - Get started tutorial
- [API Reference](data/index.md) - Complete data interfaces
- [Contributing](contributing.md) - How to contribute

---

<div align="center">

**AKShare** | *Open Data. Open Minds.*

[GitHub](https://github.com/akfamily/akshare) • [Documentation](https://akshare.akfamily.xyz) • [Issues](https://github.com/akfamily/akshare/issues)

</div>
