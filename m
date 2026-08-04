Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E526444717
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877699; cv=none; b=TLo4W0OQLgiKcrm/0/wz+JJKobcYEJm5ZBXrwlgW0uBenDMOgu6sfh2DPNWJLrwiBeItOuYXVHAvtrJdaEWaWmpwFsIxPqgmDcmXdgWOLhWzCC5Vxb38wX7FLKMOx+SrHY5BGH3pkCKcOIemiBhuUWok42hBl/NK5bRDuXf9kio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877699; c=relaxed/simple;
	bh=GzRN9Lkuog3ErMohJcR0XxF255K84xRwMvry3prLwjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCl9hM/pbyLtzcSeN+b4aktXftAhqSfog7g6NR7qlobHzE0dUDFpudZ3UEiM5LbPoJlGEgUxKP4R7QNui8kbuSlQfdGGW/JUwneyb8wWA3zh5HdDuWYEhTw9AKMKLCqpf9RWw+EvWHZhlL48ZLAGDrlCN+/GhyTyqHGTlSeMIBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/eBv85Z; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/eBv85Z"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e347638adso282665a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 14:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785877697; x=1786482497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lbnB6/2CfdYmMgjgs7OcH9+rJcQl6sCJH0syanX8ZwA=;
        b=S/eBv85ZgtBv2LvjSK8tku6N1NhGL4h2eiTCmrB7ebf9yAF7xNEkuIrs86PKMlDyhY
         Kh5cBxJmLECaMDNFxqsf/ZAW1a2ciITVbvZZue6I0aQzjiC73ZRRJwXXBag903FuLK4x
         XwmXMnR/W5ZYuRVg2+E5PwXrgt1DFDhJDmnKi1HwueRZGGz1fBUCLVl4+KrXN5awTxcf
         4jr5jukvXgsmmlIdlDXibHiC3Sv8JVu8JW40a1JqVOvweqdMEC2mU0iXEzDlxL1r9vHQ
         HSxhic6/shWiIke0w6/ccN6qdQNCnBZY0kajD3+bFAfcTTbaNngLJN80Lu4Ztd5ZyYdi
         kL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785877697; x=1786482497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbnB6/2CfdYmMgjgs7OcH9+rJcQl6sCJH0syanX8ZwA=;
        b=fnYq/d7OOLpFuzhNpsLpbwj1/xeAVLICTk6Z5tV7/AzYzs3Zb0EpgAIwnm5koTloaj
         SQ89YDgusGps95HGgXXaq15EqDGXdtXlLSUyyx5skCDbB+zZYTo1FmD48r5lWksWyI6V
         0cvd0qriOVEV5TZkMfEBvQpabLHG46urFw+CB+3IytghTf+IwbwJVw2Ivsx+6Pv7nqqp
         ejCsSM5CFvoLNewOZX9Mg7zBLP0N2tIyEK5clRjKnP01qtbHdVPd86m6XrQfKtOwNu0l
         PZFXJeZRVAcE7aTiTZ1BrrvuQG1JsRLFx9tXcEwIkibgS2etT+BIq4QKn3jIU6X2WkxT
         Yk6w==
X-Forwarded-Encrypted: i=1; AHgh+RprSd1pSpIZpUEe6CSIXAUkV7ubSnjvXAbcwb3740IGEPPtqiYhNoZjhtO+z91yscxrqqFCqSEe8Xu6dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXMf7KehrHSfSwPvHt2TefuLPfKTaLBoI9jLMOhqxi4bK9jLjv
	EJkPurrgCSiV7CFJgYftaB8VrL29RMlL20xAP4X01LznIv99ryP2++rP
X-Gm-Gg: AR+sD13ZPtNhSaSskkDtz8K0bUxE1ywHlRWK0NYImCRPkdl50Swi8LQMjIYU+ym4TcY
	hSg6wOw3c9GC4hOBBnPGBp+tNze/5AdMAq8YKA58djhJKMXMLbay7KfHU2lTOjE81JTBel0SNZj
	Etp85Lby3vA8KN3J5zetGOAu1ET5zmTnPnUmwKLcRFbPx7rWoOnsSJ3YKjMudCcy5LM5g1GSMY3
	ho+R07KYnz79jaBkoiB08808XDF/eeKeuKKcN9UjD9E9Qa6ifA1BzOHLGvy94wS8WkT0Sn365KQ
	iEzJ2b6yM1zRgXhAutYtGpjIFgC5tE0XMllS6/iYW2e7dX4Qx2decx+s6xxglHgHJKGKX9Ld924
	GWOKoLxRipGZWusiHrejnTQxDEvnigVkA6uapZHVY1X9qFVPqpGjGBxvVLrWcspjCoQCT9nfxCw
	lq0sYAMa3wzem6Uy2btE0tjorROD2MdDvxHpr8VFTn3Zro2deFPicmOIgyv1NwO0vTeyz8Nyo3S
	A==
X-Received: by 2002:a17:90b:2d50:b0:380:f34a:6ff1 with SMTP id 98e67ed59e1d1-3903c5e0213mr1542063a91.17.1785877696824;
        Tue, 04 Aug 2026 14:08:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903f5e21c7sm113014a91.3.2026.08.04.14.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 14:08:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 4 Aug 2026 14:08:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Qingshuang Fu <fffsqian@163.com>
Cc: Aleksandr Mezin <mezin.alexander@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: Re: [PATCH] hwmon: (nzxt-smart2) Check return value of init_device()
 in probe
Message-ID: <a45b0d55-4112-4c63-b855-11e9a507836e@roeck-us.net>
References: <20260804074842.505923-1-fffsqian@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804074842.505923-1-fffsqian@163.com>

On Tue, Aug 04, 2026 at 03:48:42PM +0800, Qingshuang Fu wrote:
> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
> 
> The init_device() call in nzxt_smart2_hid_probe() can fail because it
> sends HID output reports to the hardware to detect fans and set the
> update interval.  If the hardware is not responding or the HID reports
> fail, init_device() returns a negative error code.
> 
> However, the return value was ignored, causing the probe to continue
> and register an hwmon device even though the device was never properly
> initialized.  This leads to an inconsistent state where the driver
> reports stale data or blocks on wait queues that will never be woken.
> 
> The same function's return value is already checked in the
> reset_resume() handler, confirming the author's intent that errors
> should be propagated.
> 
> Note that this fix was not possible before commit 59d104b54b0b
> ("hwmon: (nzxt-smart2) Stop device IO before calling hid_hw_stop")
> because the out_hw_close error path was missing hid_device_io_stop(),
> which would have opened a use-after-free risk window.
> 
> Fixes: 53e68c20aeb1 ("hwmon: add driver for NZXT RGB&Fan Controller/Smart Device v2.")
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/nzxt-smart2.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> 
> base-commit: 848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
> 
> diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
> index ff0c0bee0e83..efc78a8f58c8 100644
> --- a/drivers/hwmon/nzxt-smart2.c
> +++ b/drivers/hwmon/nzxt-smart2.c
> @@ -754,7 +754,11 @@ static int nzxt_smart2_hid_probe(struct hid_device *hdev,
>  
>  	hid_device_io_start(hdev);
>  
> -	init_device(drvdata, UPDATE_INTERVAL_DEFAULT_MS);
> +	ret = init_device(drvdata, UPDATE_INTERVAL_DEFAULT_MS);
> +	if (ret) {
> +		dev_err(&hdev->dev, "init_device failed: %d\n", ret);
> +		goto out_hw_close;
> +	}
>  
>  	drvdata->hwmon =
>  		hwmon_device_register_with_info(&hdev->dev, "nzxtsmart2", drvdata,
