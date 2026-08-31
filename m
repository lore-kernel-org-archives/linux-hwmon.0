Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2978A44AB81
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186407; cv=none; b=N+ugsz163lboSlWRy9CunVVhrT//984ka0lpPGh9sGmXtWPLkRxFB3GJsDPVIdbWdqb26sSduBo+Pa+WdjpT1+781s1DqaABhuVE7C1lt0chPMLaUN8ryudimzQ1nz+Xvk01QOX9cxE5Sa5aN63pL4JnpEGY/kMKjmHjKj2Djv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186407; c=relaxed/simple;
	bh=wsKRpLlsmgcTbJ1BWZgMNeanaZZBwWDLeXmduYOOh3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlsQCNA8Ahhe6wCLChYunrRrV5XBrVpYZizLcApyhLE7nfv1OiIIRpaAmQG/j1DqLvQGAxu7pVIw9haRP2tgEJn+wJqQUjoH+0+/BSsOxcGiSsYX/Ap/0H+lICAugU92cxVk3yymTZ7aBGkP1qH1PbsnsTeytkhPAstR20NQLc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXV4a/66; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXV4a/66"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d6efd73032so38119395ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 07:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186405; x=1788791205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WluRCjkia+1tPs9bNfIuaxHPsKCaiBiYVNlOY7m4ry8=;
        b=BXV4a/662qnUodISD1RawZ9cxj2ePdlBGePPXXYmwFUwHsEExvcC2fg82/JXOg73Ox
         7YGkDmHGICUS31mbKJWYjpLrqVfUNlLhYlRg+df/JXn2EFm6ceOfOaaY476EF981/ww2
         oLs9M4F4IIfw0EB/nCtPon8pR8tluQ+syG1P8MkBGCQYiOByM6mSqhwsBlJzjUBohbiv
         2LRnCbLaDBWVEKdJeOhT+wl+Xf/A1YAsHrK5a2ribSUsfWm90IP8NuQ0M9dSFQpxEh+T
         8GeT+uCWuNX+ZCJ0yxs2syCAqDOjYGEMTSMRyV7b+v63792p19j2P5z0SZBMb6hgpLtE
         bZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186405; x=1788791205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WluRCjkia+1tPs9bNfIuaxHPsKCaiBiYVNlOY7m4ry8=;
        b=hJkjxjHZAV72DsCp1nokcCIeD2AU1qqgcwc1rQQqKV7mH11jzX1fcE4T77DOzRX3BN
         evZOThF9ffLJ53+kSf+ee8OM5E/OfOu8uJYDQjB72SGBkjEb3s3OpT+JEuwehNOOJ794
         bsNn1b2QLtGFRRtgmgeyEFH9MUdVEHdl0FaFUgNiAGbs4YrEdafAGC16rI+B5P3K9V0j
         ydtHd+d9invzTlPu6bxEoTDkdrkW6/ceuyCEW/KaLBzyMFURsjiYjCQgphly/9oHzmsX
         te+Oslim2ayDTn2WDK1xsay3/mXSvNzaGScDSxxvm7DfpriGSAUYovuqdzfw01UsZDHQ
         t/Xg==
X-Forwarded-Encrypted: i=1; AHgh+Roh5CdlQloKzCMr241bym9yOldCEIZWBktSomr1OgdL/MQOxKRLL9Zuyea08LrcjgMPqOb4wrWfdUhlFw==@vger.kernel.org
X-Gm-Message-State: AFuF++mNO0yIk+/8IAKnTzcMpNoc2OohomFODf6ADJh3obKSX+RW/uZ1
	cfljJ9ZG7hQ0T51kkK/wdhUSCHcdU5rQ1td5snf7thENnstX7snMBk2R
X-Gm-Gg: AYBFou2sTIpyMGFt8AvHZYYmx4EDXnVRNTnufoSVAQrJTPGu6Ta7CqfqqO4c6ua1Slx
	SNJi9SxSrJb/vPVRtJcS1MjDk0PYE1JArrQnMuPgngFHbgj7l8BbxK/zMpaa1qjCecGyAXkADLK
	iOtZ/3swG5n52izh80+21W075qu4rqxHxTZqaA9WWeet2U+ZmSh2VnTgn9p2XtSevuQNqHAnAi2
	cXcqjIwrtDAjehg/iyPkWhPkqhwfziEhFqQYQHjmRcOe+airSI+vG9s25AEaO/w2nKNhI3OYaoS
	x+QFuoOHK0NXmljdw4Oa337jU/LWBNTUblOWLkFvJaFhdaLGboye6ZqCQef3bopfC7j9y/JU1jl
	1q8UbmseTd+JtTJz/FJZAwuAaMI95Mp8RnmAu33j26iWzI7a1fiCZfURdxWM3wj7big61A0cA/0
	czvSU50q5589+8UkITGi38xOGYMwQJ5GNdU8ZvwdX/AmW8ghisX14ifQnwfmnk0MXlHPc6XBX/a
	CRBurOCMQ+S
X-Received: by 2002:a17:903:2b04:b0:2c9:d277:2cdb with SMTP id d9443c01a7336-2d91b002e3fmr73563805ad.9.1788186405287;
        Mon, 31 Aug 2026 07:26:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8750057e5sm33541385ad.66.2026.08.31.07.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:26:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 31 Aug 2026 07:26:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Marius Zachmann <mail@mariuszachmann.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] hwmon: (corsair-cpro) Create debugfs entries after
 hwmon registration
Message-ID: <a3bfd099-c81e-4a0c-9796-6afd1502a8f0@roeck-us.net>
References: <20260831014509.3352442-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831014509.3352442-1-lilinmao@kylinos.cn>

On Mon, Aug 31, 2026 at 09:45:09AM +0800, Linmao Li wrote:
> ccp_debugfs_init() registers debugfs files whose private data is the devm
> allocated ccp.  It runs before hwmon_device_register_with_info(), so when
> that registration fails, ccp_probe() returns with the files still in
> place.  The HID core then frees ccp, and ccp_remove() is not called for a
> failed probe, so nothing removes them later either.  Reading one of the
> files dereferences the freed pointer.
> 
> Create the debugfs entries only after the hwmon device has been
> registered, so no failing path can leave them behind.
> 
> The two version queries stay where they are.  They send USB commands
> without holding ccp->mutex, which is only safe as long as nothing else
> can call send_usb_cmd(); once the hwmon device is registered its
> callbacks can do so concurrently.  Only the debugfs creation moves, and
> it is told which queries succeeded.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-hwmon/20260708031612.BD7E61F000E9@smtp.kernel.org/
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 5997eb60f896 ("hwmon: (corsair-cpro) Add firmware and bootloader information")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Applied.

Thanks,
Guenter

> ---
> 
> Notes (v2changelog):
>     v2: Create the debugfs entries after hwmon registration instead of
>         removing them on the error path, as suggested by Guenter Roeck.  The
>         version queries stay before the registration.
>     Link: https://lore.kernel.org/linux-hwmon/20260828061949.3151191-1-lilinmao@kylinos.cn/
> 
>  drivers/hwmon/corsair-cpro.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> 
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> 
> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> index 8354a002f4c5..56de0fe0f544 100644
> --- a/drivers/hwmon/corsair-cpro.c
> +++ b/drivers/hwmon/corsair-cpro.c
> @@ -566,21 +566,18 @@ static int bootloader_show(struct seq_file *seqf, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(bootloader);
>  
> -static void ccp_debugfs_init(struct ccp_device *ccp)
> +static void ccp_debugfs_init(struct ccp_device *ccp, bool fw_valid, bool bl_valid)
>  {
>  	char name[32];
> -	int ret;
>  
>  	scnprintf(name, sizeof(name), "corsaircpro-%s", dev_name(&ccp->hdev->dev));
>  	ccp->debugfs = debugfs_create_dir(name, NULL);
>  
> -	ret = get_fw_version(ccp);
> -	if (!ret)
> +	if (fw_valid)
>  		debugfs_create_file("firmware_version", 0444,
>  				    ccp->debugfs, ccp, &firmware_fops);
>  
> -	ret = get_bl_version(ccp);
> -	if (!ret)
> +	if (bl_valid)
>  		debugfs_create_file("bootloader_version", 0444,
>  				    ccp->debugfs, ccp, &bootloader_fops);
>  }
> @@ -588,6 +585,7 @@ static void ccp_debugfs_init(struct ccp_device *ccp)
>  static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  {
>  	struct ccp_device *ccp;
> +	bool fw_valid, bl_valid;
>  	int ret;
>  
>  	ccp = devm_kzalloc(&hdev->dev, sizeof(*ccp), GFP_KERNEL);
> @@ -632,7 +630,13 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	if (ret)
>  		goto out_hw_close;
>  
> -	ccp_debugfs_init(ccp);
> +	/*
> +	 * Query the versions before registering the hwmon device: they send
> +	 * USB commands without holding ccp->mutex, which is only safe while
> +	 * nothing else can call send_usb_cmd().
> +	 */
> +	fw_valid = !get_fw_version(ccp);
> +	bl_valid = !get_bl_version(ccp);
>  
>  	ccp->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
>  							 ccp, &ccp_chip_info, NULL);
> @@ -641,6 +645,8 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		goto out_hw_close;
>  	}
>  
> +	ccp_debugfs_init(ccp, fw_valid, bl_valid);
> +
>  	return 0;
>  
>  out_hw_close:
