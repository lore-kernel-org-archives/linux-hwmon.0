Return-Path: <sslayer@salem.gmr.ssr.upm.es>
Return-path: <sslayer@salem.gmr.ssr.upm.es>
Date: Thu, 22 Mar 2018 15:36:04 +0100
From: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm92) Add max6635 to lm92_id[]
Message-ID: <20180322143603.GA20667@salem.gmr.ssr.upm.es>
References: <20180322134311.19485-1-alvaro.gamez@hazent.com>
 <20180322152947.08642b1a@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180322152947.08642b1a@endymion>
List-ID: <linux-hwmon@vger.kernel.org>

Hi!

On Thu, Mar 22, 2018 at 03:29:47PM +0100, Jean Delvare wrote:
> As the driver doesn't treat the two devices differently, the enum isn't
> really needed. I don't really mind though, just a notice.

Yeah, I just thought it looked cleaner this way. I thought also about
adding an enum chips entry to struct lm92_data, but I didn't like that
because there's no use for it right now, until (if) the driver is extended
to support different but similar enough chips, so I just added the enum.

> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
> Please also update Documentation/hwmon/lm92 which currently claims that
> the max6635 must use "lm92" as prefix.

Oh, I totally forgot about that. I'll be sending patch v2 in a couple of
minutes.

Thank you!


-- 
Alvaro G. M.
