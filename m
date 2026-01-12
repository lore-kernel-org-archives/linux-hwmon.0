Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAC03806B6
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 18:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241273; cv=none; b=RcYVaKxIZy4FsDAfaeKHWioDN84u+Hh+WjMzRITRRbT1TieB/yPPtxrDG/tQ5zWLyk+FDGt1T21cSGrhVKHV8m0grUyU0Uvg44OW5GXuY0zjHBv7OioLX90JwMvSC7EvGWE55S41OYs5We9eyrS0hmmEP+vzW7Bcp+KI28Hjc1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241273; c=relaxed/simple;
	bh=dHrr/T4aX+vs3oAgOvAPZZQy7mi8rDhEwAcJ4vKtt48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sG1pCIUK6r4USisEEj/awd0Lta17WLIJDjScYyyV7zQkvLOqGWATnS46f37Gt/IPOjpWtnjaqSrFdjdaFpdBarCZ/Sxz2FvVfEmyhbxw+zQJ2ziDj47IlfVzpC5lqqj9bddY7NG0U12bUo+jGu/PqZjqCCO5ZvPgcXCWzcZSx8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccDCxXBY; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccDCxXBY"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0bae9aca3so42976385ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 10:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768241272; x=1768846072; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDGQRAbPUjfkXaVJhLTd0EOsqSoToEi+iTNTPo6suIg=;
        b=ccDCxXBYhuF35ZvvT//IXUBYFG5RQ562qWvlVHF0KxTlZgMF2/fBrYhuPVTiiHNz2r
         yFVJovT+sUOPzu0DVGKbfN/CpH3NIR7DVIfkem+4VxjDz8TGjCvfbMnVEyMK8fAKSVoR
         z/TQYsTlkgM2Sor3aWES2vEgKdT0P5sNff55KAPIgJtJ/n5DvCHso7vTi/jiL/xn6r6L
         P7d8TnDWL7dm5snN7ESHk6zgqOoBV3fVuB10T0j3xdllJtCzQU3Fq/2qpSZOhg5wnt9x
         HCRawoUcJxy3U3dk9Y0j5moAtKv+PsgsBenN1d7daR5u+Vg8+sSInp2A6eSRX6HyoroD
         qUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768241272; x=1768846072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDGQRAbPUjfkXaVJhLTd0EOsqSoToEi+iTNTPo6suIg=;
        b=s/jz7N4A3QIkjF4hnZqiMK3AZW4NGJtm1Lp2EcdpU/2tYaFjcmoxsEO+Tu8nECjSvt
         zL7ybud2kjL7N9FXPAr4EV3FcQFEfcvD5yie8XoYm5UDc3uMmLpDnq0FTI+YpCN3sJpO
         36Zpim+C1mAD26W/TVxMjA01qKeZUdqtrWa25XPGZek8KQGsGQla0zCLEy7xJfN5geS6
         lmmBwyA7jqOatQG4YDftuauw6m0qrwCp8T6F52Jbi60KWiccQMfvyc7BQ11Oz891FfjQ
         AloS3eydqhwjUQS2gLp2U1J7Ay/9KStD2uZEPNOQTODmmheBKFRzepco2UbamW7m+m5H
         jX5A==
X-Forwarded-Encrypted: i=1; AJvYcCUpz8JTZ6y34ExJSTEQ2NQMIxfVLY5DYv8z7eqqHsVtURsJwEKZv2JEtFs7LNE/TN0e8T/DSfieb8O16A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVlvhff568MZNuVqKfpZrcN0TIwr2o9V96rGcz1Za+/JgvEvFr
	VH0jlxZjmJbkmmA8t47RED9Hlp3ZIYoGQ0PelnwbG0bzoSzlXJwW397XTs1X3w==
X-Gm-Gg: AY/fxX5xHUOwvDFC2ol1PMyEtAM+E/eB6HY9jxBQcpE7wdqq1PqUCWKLDTMnkFlIzS0
	+NfWNnIAsIb5UgbV4wm7B03chcmfUKkDptjyzByEte6fVFoVbVpCV942DTlKs9sOld8nQrrDJHd
	yNDOjQmd21hpwNIHopIfPAon0mX95tjmVGRoUsysrqucedB+CFM//eF3WBqAxtsR1ndXZbTliAW
	xvE8Jz7YsUHplp2i2BduGTBs2r7xnKooT5jelj9/sU7db12/IFSv9V4z/Tcld97TLReLBGu8DU3
	QMuxqS9JV64fjYsaJ6fkSmZ4Tw2v80+WZsI7eNmx/VnpUgXy+65af1fSZ6Cp97qohRwSbyvboHE
	aZLJB10RSp2VyI57NzSgkxJ/M45B7jNRLpm1HPPI/puNohD6SgQzEbFR2cOMRc9IQqLAxmBgTv+
	VO14PnjDSLwMs39YVw61s=
X-Google-Smtp-Source: AGHT+IEUzxrN8NZqXvPH5JJMBYF3btzaRQp1HHCq9owJBNQYe6YmOBfDUYXF/ZMNTxgE09jJO72Ljg==
X-Received: by 2002:a17:903:234c:b0:29d:6b8e:d565 with SMTP id d9443c01a7336-2a3ee4c0e80mr152917325ad.38.1768241271894;
        Mon, 12 Jan 2026 10:07:51 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88fcsm178881325ad.83.2026.01.12.10.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:07:51 -0800 (PST)
Date: Mon, 12 Jan 2026 23:37:43 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] platform/x86: hp-wmi: implement fan keep-alive
Message-ID: <aWU3oEJinHyO__1X@archlinux>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com>
 <20251230145053.516196-1-krishna.chomal108@gmail.com>
 <20251230145053.516196-3-krishna.chomal108@gmail.com>
 <6b2be55e-dcfe-74b7-d8ca-b78f49cedb7a@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b2be55e-dcfe-74b7-d8ca-b78f49cedb7a@linux.intel.com>

On Mon, Jan 12, 2026 at 05:14:12PM +0200, Ilpo Järvinen wrote:
[snip]
>>  static void __exit hp_wmi_bios_remove(struct platform_device *device)
>>  {
>>  	int i;
>> +	struct hp_wmi_hwmon_priv *ctx;
>
>Can't we just call this priv everywhere as per the normal custom?
>

Yes this was a mistake, I forgot to rename "ctx" to "priv" in v2, sorry.
I will ensure to fix this in v3.
