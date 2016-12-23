Return-path: <Ray.Huang@amd.com>
Date: Fri, 23 Dec 2016 11:23:17 +0800
From: Huang Rui <ray.huang@amd.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
CC: <kernel-janitors@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 65/66] hwmon: (fam15h_power) use permission-specific
 DEVICE_ATTR variants
Message-ID: <20161223032316.GA11339@hr-amur2>
References: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
 <1482408335-3435-66-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1482408335-3435-66-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Dec 22, 2016 at 01:05:34PM +0100, Julia Lawall wrote:
> Use DEVICE_ATTR_RO etc. for read only attributes etc.  This simplifies the
> source code, improves readbility, and reduces the chance of
> inconsistencies.
> 
> The semantic patch for the RO case, in the case where the show function
> already has the expected name, is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @ro@
> declarer name DEVICE_ATTR;
> identifier x,x_show;
> @@
> 
> DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
> 
> @script:ocaml@
> x << ro.x;
> x_show << ro.x_show;
> @@
> 
> if not (x^"_show" = x_show) then Coccilib.include_match false
> 
> @@
> declarer name DEVICE_ATTR_RO;
> identifier ro.x,ro.x_show;
> @@
> 
> - DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
> + DEVICE_ATTR_RO(x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 

Acked-by: Huang Rui <ray.huang@amd.com>

Thanks,
Rui

> ---
>  drivers/hwmon/fam15h_power.c |   34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
> index 15aa49d..9545a34 100644
> --- a/drivers/hwmon/fam15h_power.c
> +++ b/drivers/hwmon/fam15h_power.c
> @@ -83,8 +83,8 @@ static bool is_carrizo_or_later(void)
>  	return boot_cpu_data.x86 == 0x15 && boot_cpu_data.x86_model >= 0x60;
>  }
>  
> -static ssize_t show_power(struct device *dev,
> -			  struct device_attribute *attr, char *buf)
> +static ssize_t power1_input_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
>  {
>  	u32 val, tdp_limit, running_avg_range;
>  	s32 running_avg_capture;
> @@ -136,16 +136,16 @@ static ssize_t show_power(struct device *dev,
>  	curr_pwr_watts = (curr_pwr_watts * 15625) >> (10 + running_avg_range);
>  	return sprintf(buf, "%u\n", (unsigned int) curr_pwr_watts);
>  }
> -static DEVICE_ATTR(power1_input, S_IRUGO, show_power, NULL);
> +static DEVICE_ATTR_RO(power1_input);
>  
> -static ssize_t show_power_crit(struct device *dev,
> -			       struct device_attribute *attr, char *buf)
> +static ssize_t power1_crit_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
>  {
>  	struct fam15h_power_data *data = dev_get_drvdata(dev);
>  
>  	return sprintf(buf, "%u\n", data->processor_pwr_watts);
>  }
> -static DEVICE_ATTR(power1_crit, S_IRUGO, show_power_crit, NULL);
> +static DEVICE_ATTR_RO(power1_crit);
>  
>  static void do_read_registers_on_cu(void *_data)
>  {
> @@ -212,9 +212,8 @@ static int read_registers(struct fam15h_power_data *data)
>  	return 0;
>  }
>  
> -static ssize_t acc_show_power(struct device *dev,
> -			      struct device_attribute *attr,
> -			      char *buf)
> +static ssize_t power1_average_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
>  {
>  	struct fam15h_power_data *data = dev_get_drvdata(dev);
>  	u64 prev_cu_acc_power[MAX_CUS], prev_ptsc[MAX_CUS],
> @@ -267,20 +266,20 @@ static ssize_t acc_show_power(struct device *dev,
>  
>  	return sprintf(buf, "%llu\n", (unsigned long long)avg_acc);
>  }
> -static DEVICE_ATTR(power1_average, S_IRUGO, acc_show_power, NULL);
> +static DEVICE_ATTR_RO(power1_average);
>  
> -static ssize_t acc_show_power_period(struct device *dev,
> -				     struct device_attribute *attr,
> -				     char *buf)
> +static ssize_t power1_average_interval_show(struct device *dev,
> +					    struct device_attribute *attr,
> +					    char *buf)
>  {
>  	struct fam15h_power_data *data = dev_get_drvdata(dev);
>  
>  	return sprintf(buf, "%lu\n", data->power_period);
>  }
>  
> -static ssize_t acc_set_power_period(struct device *dev,
> -				    struct device_attribute *attr,
> -				    const char *buf, size_t count)
> +static ssize_t power1_average_interval_store(struct device *dev,
> +					     struct device_attribute *attr,
> +					     const char *buf, size_t count)
>  {
>  	struct fam15h_power_data *data = dev_get_drvdata(dev);
>  	unsigned long temp;
> @@ -301,8 +300,7 @@ static ssize_t acc_set_power_period(struct device *dev,
>  
>  	return count;
>  }
> -static DEVICE_ATTR(power1_average_interval, S_IRUGO | S_IWUSR,
> -		   acc_show_power_period, acc_set_power_period);
> +static DEVICE_ATTR_RW(power1_average_interval);
>  
>  static int fam15h_power_init_attrs(struct pci_dev *pdev,
>  				   struct fam15h_power_data *data)
> 
