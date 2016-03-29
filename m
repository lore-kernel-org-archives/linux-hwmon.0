Return-path: <bp@alien8.de>
Date: Tue, 29 Mar 2016 09:25:57 +0200
From: Borislav Petkov <bp@alien8.de>
To: Huang Rui <ray.huang@amd.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.de>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	spg_linux_kernel@amd.com
Subject: Re: [PATCH v5 4/6] hwmon: (fam15h_power) Introduce a cpu accumulated
 power reporting algorithm
Message-ID: <20160329072557.GA3705@pd.tnic>
References: <1459143136-2412-1-git-send-email-ray.huang@amd.com>
 <1459143136-2412-5-git-send-email-ray.huang@amd.com>
 <20160328093327.GC26651@pd.tnic>
 <20160329032847.GB18406@hr-amur2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20160329032847.GB18406@hr-amur2>
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Mar 29, 2016 at 11:28:48AM +0800, Huang Rui wrote:
> I checked with HW designer, milliseconds is also a reasonable interval
> of acc power. And I cannot set too long here, because several seconds
> will cause the read function to hang for that period of time.

Exactly this justification should be as a comment in the code above the
setting of the default value.

> So I pick 10ms here, and actually, we can update the interval at
> /etc/sensors3.conf
> 
> chip "fam15h_power-*"
>         set power1_average_interval 0.01

I think this text should be in Documentation/hwmon/fam15h_power for
users to know.

Thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
