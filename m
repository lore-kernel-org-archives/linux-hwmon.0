Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48466 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932360AbcLHTYQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Dec 2016 14:24:16 -0500
Date: Thu, 8 Dec 2016 11:24:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.de>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 04/17] hwmon: (smsc47m192) Fix overflows seen when
 writing into limit attributes
Message-ID: <20161208192409.GA3935@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
 <1480913740-5678-4-git-send-email-linux@roeck-us.net>
 <20161208145700.2f97c256@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161208145700.2f97c256@endymion>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Dec 08, 2016 at 02:57:00PM +0100, Jean Delvare wrote:
> On Sun,  4 Dec 2016 20:55:27 -0800, Guenter Roeck wrote:
> > Module test reports overflows when writing into temperature and voltage
> > limit attributes
> > 
> > temp1_min: Suspected overflow: [127000 vs. 0]
> > temp1_max: Suspected overflow: [127000 vs. 0]
> > temp1_offset: Suspected overflow: [127000 vs. 0]
> > temp2_min: Suspected overflow: [127000 vs. 0]
> > temp2_max: Suspected overflow: [127000 vs. 0]
> > temp2_offset: Suspected overflow: [127000 vs. 0]
> > temp3_min: Suspected overflow: [127000 vs. 0]
> > temp3_max: Suspected overflow: [127000 vs. 0]
> > temp3_offset: Suspected overflow: [127000 vs. 0]
> > in0_min: Suspected overflow: [3320 vs. 0]
> > in0_max: Suspected overflow: [3320 vs. 0]
> > in4_min: Suspected overflow: [15938 vs. 0]
> > in4_max: Suspected overflow: [15938 vs. 0]
> > in6_min: Suspected overflow: [1992 vs. 0]
> > in6_max: Suspected overflow: [1992 vs. 0]
> > in7_min: Suspected overflow: [2391 vs. 0]
> > in7_max: Suspected overflow: [2391 vs. 0]
> > 
> > The problem is caused by conversions from unsigned long to long and
> > from long to int.
> > 
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  drivers/hwmon/smsc47m192.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwmon/smsc47m192.c b/drivers/hwmon/smsc47m192.c
> > index 6ac7cda72d4c..202e167d6a59 100644
> > --- a/drivers/hwmon/smsc47m192.c
> > +++ b/drivers/hwmon/smsc47m192.c
> > @@ -77,6 +77,7 @@ static inline unsigned int IN_FROM_REG(u8 reg, int n)
> >  
> >  static inline u8 IN_TO_REG(unsigned long val, int n)
> >  {
> > +	val = clamp_val(val, 0, 65535);
> >  	return clamp_val(SCALE(val, 192, nom_mv[n]), 0, 255);
> >  }
> 
> Same as for adm9240, I would suggest to remove the second clamp_val():
> 
> static inline u8 IN_TO_REG(unsigned long val, int n)
> {
> 	val = clamp_val(val, 0, nom_mv[n] * 255 / 192);
> 	return SCALE(val, 192, nom_mv[n]);
> }
> 
I updated the patch accordingly.

Thanks,
Guenter

> >  
> > @@ -84,7 +85,7 @@ static inline u8 IN_TO_REG(unsigned long val, int n)
> >   * TEMP: 0.001 degC units (-128C to +127C)
> >   * REG: 1C/bit, two's complement
> >   */
> > -static inline s8 TEMP_TO_REG(int val)
> > +static inline s8 TEMP_TO_REG(long val)
> >  {
> >  	return SCALE(clamp_val(val, -128000, 127000), 1, 1000);
> >  }
> 
> Other than this:
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
> -- 
> Jean Delvare
> SUSE L3 Support
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
