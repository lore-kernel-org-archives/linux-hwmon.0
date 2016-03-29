Return-path: <Ray.Huang@amd.com>
Date: Tue, 29 Mar 2016 11:28:48 +0800
From: Huang Rui <ray.huang@amd.com>
To: Borislav Petkov <bp@alien8.de>
CC: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>,
	<linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<spg_linux_kernel@amd.com>
Subject: Re: [PATCH v5 4/6] hwmon: (fam15h_power) Introduce a cpu accumulated
 power reporting algorithm
Message-ID: <20160329032847.GB18406@hr-amur2>
References: <1459143136-2412-1-git-send-email-ray.huang@amd.com>
 <1459143136-2412-5-git-send-email-ray.huang@amd.com>
 <20160328093327.GC26651@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20160328093327.GC26651@pd.tnic>
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Mar 28, 2016 at 11:33:27AM +0200, Borislav Petkov wrote:
> On Mon, Mar 28, 2016 at 01:32:14PM +0800, Huang Rui wrote:
> >  
> >  	return 0;
> > @@ -330,6 +446,9 @@ static int fam15h_power_init_data(struct pci_dev *f4,
> >  
> >  	data->max_cu_acc_power = tmp;
> >  
> > +	/* set default interval as 10 ms */
> 
> Because...?
> 

I checked with HW designer, milliseconds is also a reasonable interval of acc power.
And I cannot set too long here, because several seconds will cause the
read function to hang for that period of time.

So I pick 10ms here, and actually, we can update the interval at
/etc/sensors3.conf

chip "fam15h_power-*"
        set power1_average_interval 0.01

Thanks,
Rui
