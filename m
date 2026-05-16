Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4838F3D6465
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778935858; cv=none; b=pEDxxuU3DTSInTNw12SeupkGG5hCOCuwc7oaGIsF7o2j1dapjaY29yHMX+qmkIuIuz/Kl7TAwB6zp9lIfnj9khqOrTc5UUKe4lGIcXGgQYVylmo/qoZrVTJDwVWFZ6+qdIibTD8DpEVo+GHl/aSYA90gRJ4Q/fhvCtz2lOSXitc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778935858; c=relaxed/simple;
	bh=cjF41LislovNrKBBxrqS+3UmXx+XEN1IOxlEEO0t5Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VK8vob09VLeUWfPZ20DvTi7xHanFOwVI3aOx0zFIudrtj7EaQtoxz8DANWXz1QWwEyoTM2haFPgnRCqx4QOy41VrK3N3Pd0xA5cQKRYeWZQkbmbOHGfUdwEG3y50E66bmHvlN6FExriPs9I6AOBETl+LfDiaLHXO8IV0Vg6Eo20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFb/9hht; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFb/9hht"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-366be8040a9so257182a91.3
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 05:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778935857; x=1779540657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+qx3eTngXVCuxXDVoPTQXVaaBA80s1wEeSi6eUvohM=;
        b=KFb/9hht1ScJeJOuD/dOpoU8MBtF/fItW25xg5WpS03fZuYi/KSBcfZ+N55M8lu5pA
         xEw5LS5mr66fq86KmfIkw5m+2XsBLr+bFQ2Uro2L5t8KwuFIxUvkUdiXUQrLvOcarFqf
         aZJ2W3e0vpHAp1GoYoAskI/mtARL87PoBPnvhmU650TwzvUx4PcNn9+KvzlY6Ob2o1cy
         KMUsFl6Yy/FMwUxiBjwOB2PattVlRBi0YBrB+HqcTX0Qr4X0g1vjKnuDXqq6DlkMUR74
         R05B92fhE7qxipW3ZdxkesGGlRUxnac59eff5wyl9zO/Lnqc7nhPonu+5/wBWqHiL0bw
         0vTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778935857; x=1779540657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4+qx3eTngXVCuxXDVoPTQXVaaBA80s1wEeSi6eUvohM=;
        b=UtexFbDCxWJM3ZNp3wQihc7K5EdrJnRy3YLEtN9AjdAU26KlH/LCjj3X5vT+G02Mcx
         GQMoMoP4rNZfEL0SVEtYlM7+4ir8zLdS1Pu+3s5wuYgxB+ItCaVVK/P6t8+4V33eMaUK
         aqktteOGUbU5QKS00NwduRVcUc64tHvbTqwn2dKYnAW6PM/jgOqwNYRdIEj3zsDsHVDT
         0KUncq+GdX5ts9ZxRydtCKlXyQfVECRewEyk3R6UlTZdzgFOtbzPw6UdDxNhBXkMIMyK
         8YAlzi5ufMEbygFSCWOcaS1nGWkVrW+DRNHK4N5dRexOTdB1kCuh8jnd/ee/ZIdSVK42
         vzXg==
X-Gm-Message-State: AOJu0YyKM2lP+X0jDtq0TKyWyDlVyVT7Nm0/ZYeb9JXtvK9iwPyuumrj
	vVNXeIpHEblJ+0y7HP/rMJsOKks9X7zovPGn1OGwW3zawoETurHnjJL9qAAGbDKX
X-Gm-Gg: Acq92OHRsiZ5E5sdPqw0kdYkYOTJZ7zZs6GSlp0PhGQRBF56AKgcU7OfTZZF80mOThI
	F3x3xquUEalXzLm4fbHENMCMb28am5F34kNIrE6sjeRoHbuTmcj4AMHu820FAWme5VarxGVidnr
	D0HD4RSa/Vou13wCeTghuHdrYgW0tBQkkm8qxghtjSkVMW2iC4ShYYAst71VpzBfDss4Lnwo9yZ
	3xeZYKD2SrQH9DHH9CU62ckVmR1Lwn5peAEaSI1QQR74qRDMWgXs0ZWAMR7nkdAvzsuh1s9cdlL
	aidHJFxTwUjjkcam/2gm4ymTcX00vTcTzMZA9mCaaTdnVx2+MvQUh08iXjXVV4pUGSYYFff16fo
	/Vbz1nGqYbe/mJnKkr3aH1HcXCnwyPEFjnfvrpovugqka7VwnuQWCXHFc/wWe7DvFqz32q28axg
	gpabQvU5YDHm9jn0AVHXflrN4UeSBHCXop3qgP
X-Received: by 2002:a17:90b:4ecc:b0:369:932a:2b8b with SMTP id 98e67ed59e1d1-369932a311cmr761144a91.11.1778935856660;
        Sat, 16 May 2026 05:50:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a160682sm1845102a91.14.2026.05.16.05.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:50:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 05:50:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: bakshansky.lists@gmail.com
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (coretemp) fix coding style issues
Message-ID: <6d062c67-5741-4a55-a741-00a5d810747c@roeck-us.net>
References: <20260516114253.5466-1-bakshansky.lists@gmail.com>
 <20260516114253.5466-3-bakshansky.lists@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516114253.5466-3-bakshansky.lists@gmail.com>

On Sat, May 16, 2026 at 02:42:53PM +0300, bakshansky.lists@gmail.com wrote:
> From: Roman Bakshansky <bakshansky.lists@gmail.com>
> 
> Address several coding style warnings reported by checkpatch.pl:
> - Replace <asm/processor.h> with <linux/processor.h>
> - Add missing blank lines after declarations
> - Combine split quoted strings
> - Reorder __initconst placement
> 
> No functional change.
> 
> Signed-off-by: Roman Bakshansky <bakshansky.lists@gmail.com>
> ---
>  drivers/hwmon/coretemp.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index c722b1d8e480..a79c2d65a2be 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -25,7 +25,7 @@
>  #include <linux/moduleparam.h>
>  #include <linux/pci.h>
>  #include <asm/msr.h>
> -#include <asm/processor.h>
> +#include <linux/processor.h>
>  #include <asm/cpu_device_id.h>
>  #include <linux/sched/isolation.h>
>  
> @@ -200,6 +200,7 @@ static int adjust_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
>  
>  	for (i = 0; i < ARRAY_SIZE(tjmax_model_table); i++) {
>  		const struct tjmax_model *tm = &tjmax_model_table[i];
> +
>  		if (c->x86_vfm == tm->vfm &&
>  		    (tm->stepping_mask == ANY ||
>  		     tm->stepping_mask == c->x86_stepping))
> @@ -222,8 +223,7 @@ static int adjust_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
>  		err = rdmsr_safe_on_cpu(id, 0x17, &eax, &edx);
>  		if (err) {
>  			dev_warn(dev,
> -				 "Unable to access MSR 0x17, assuming desktop"
> -				 " CPU\n");
> +				 "Unable to access MSR 0x17, assuming desktop CPU\n");
>  			usemsr_ee = 0;
>  		} else if (c->x86_vfm < INTEL_CORE2_PENRYN &&
>  			   !(eax & 0x10000000)) {
> @@ -257,8 +257,7 @@ static int adjust_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
>  		err = rdmsr_safe_on_cpu(id, 0xee, &eax, &edx);
>  		if (err) {
>  			dev_warn(dev,
> -				 "Unable to access MSR 0xEE, for Tjmax, left"
> -				 " at default\n");
> +				 "Unable to access MSR 0xEE, for Tjmax, left at default\n");
>  		} else if (eax & 0x40000000) {
>  			tjmax = tjmax_ee;
>  		}
> @@ -424,6 +423,7 @@ static ssize_t show_temp(struct device *dev,
>  static int create_core_attrs(struct temp_data *tdata, struct device *dev)
>  {
>  	int i;
> +

As pointed out by Sashiko, this is a false positive.

>  	static ssize_t (*const rd_ptr[TOTAL_ATTRS]) (struct device *dev,
>  			struct device_attribute *devattr, char *buf) = {
>  			show_label, show_crit_alarm, show_temp, show_tjmax,
> @@ -774,7 +774,7 @@ static int coretemp_cpu_offline(unsigned int cpu)
>  	}
>  	return 0;
>  }
> -static const struct x86_cpu_id __initconst coretemp_ids[] = {
> +static const struct x86_cpu_id coretemp_ids[] __initconst = {

checkpatch says:

CHECK: Please use a blank line after function/struct/union/enum declarations
#170: FILE: drivers/hwmon/coretemp.c:777:
 }
+static const struct x86_cpu_id coretemp_ids[] __initconst = {

Oh never mind, I'll fix that up and apply the patch.

Guenter
