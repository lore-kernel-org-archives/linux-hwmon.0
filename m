Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043192;
	b=IKUjXCSlzcK4K7tyPGMqfe0KlHSEuMIIOpyqQrz/rCyUDjtSTyPfvxy5joUE9Dadshsv
	 IWZ4ihUuopsu9JtfcIYIdqyNsilCkMSCr0OAcsYtoS0ye15SgRrTjdZ7B9tzk4znlr704
	 /WOtfSYlI+eGreemsM7nZYkKLFjIBogMySWfVMtCRVMU9a+NdXfbVmsLDA4xsCuLdeQ8Y
	 JvNWuBqdAlzRx7zofA4IQnHuhmNjZ3u55KW19cz/3vtAXtxKBCeKvOMuksDc+MCM00luu
	 Qetdf//avzp+TGO/byAfKI3AfyXXp/1maGko30GTp3Digcp8/gOBARFPGKso9J8Xg/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=04JLIlecZFZkeu2diGMCwDrGIV8T9H33DS8yBLkYP4w=;
	b=PHCUD2NGH2u6DwEW7mfjgsIEkiLVIPbRo6JXF09wkzIetlD55zfzrXGyqtkg3s1P5zwz
	 TciE5ACZ+XL2W29YbNaUrE+COb1ij03KlmZ0FJkdTAQEQ5sMzuo5EZWSSDf9ACTXkw8fJ
	 RZZy6gMEULdCZvfQSDnl3sJa4+bXM9XoONjvnvr3+WibjlopLTXXjv/YxSEjOKd0qb2UX
	 EZ0zgfWqO+jd8Xq18+DISbWTyR50lLOCKMXriDkbNJDqPLG0FhVa3Rik+5PkVMMEP55XO
	 gyfBu8UEIAeHbm1FnYQpJ1L7EJYxmhgnqAfKTIl5A/EJdIAbzKWGDxSa29jbCKVVftA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CV+nkpCa;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D16A606A31F
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 19:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D16A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CV+nkpCa
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-185fd3a4ca3so2819491c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 12:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793043191; x=1793647991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=04JLIlecZFZkeu2diGMCwDrGIV8T9H33DS8yBLkYP4w=;
        b=CV+nkpCaoa3VPlrnwXwJHelWuW5pwnNvRh1HbGC6Ozklfuph7C9LBWlM5HiS+ZtKyh
         vZHRJin5qeQdLQs46Vh/Y7y8XmyfFt1wIuGMLmycNpuRTRjHHRwUjKhKlItG7E1HruNN
         9EpECQHxqgiQqJXQ3Ef793CnUMUwP4vZd9VbpU/YfWweXdsH0gPK2nY2mqiGnjLz2Ltd
         ioV3iTLw/G1Xt3jwniteZ1Qx+TIfR9Au3qMZZfLF2dhLEuzC/txsO3BAjFyFDbnUAwhe
         BsNTLa6v+dbS9vIH/gYVgKfPOoEolRRVEQ5KR+EmjN4UcMpwUYUfpxbGAm+NxE5oTrlS
         0dgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793043191; x=1793647991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04JLIlecZFZkeu2diGMCwDrGIV8T9H33DS8yBLkYP4w=;
        b=f9Rm+myjVh/3UsSqKZr1DvSlkN3Pr/BumpyI8BuPgnGMKvtRnM6ArXNeR94PiemVw0
         3JglXkN2xBm0vSWJtffiB1YalAP0mA8FvsuTVicpc1oLE+CYAVbRRkYVKGs0e9BEejMo
         Jks5zsqJSZuD5QoO94mRkCTjPr/n4JDWNXE724CDQBwYxVu6PKiyhmFoTfkdI9Y93RG/
         drAbb+STpAHM7u8mZK5oIPuZlFjXRQCn5L0HsnQYCANUcwyw8hXjHKbrmkhrXGH3jlHZ
         F/oiWVjyyDOuhI1QULfOCCgRUqM4unm1OzSfjCbbPOUy9XO+hnANRmC+ANRmMCJrI8Gx
         eRGA==
X-Forwarded-Encrypted: i=1; AKwUvBy2Zw6Y5GLOVx67EwS7P4PjTnEny7+/2zxu2IYKODsogZHr962CFfbbkTwPwZNInA1NUlvyTCNDxw2iOA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI0iQcxsXTLiOIDj3ej1V7NNNCAuKq6KUwEYdK2x8UQToTjIR96
	gFYFuydhL4WfdKc3BwQdwo3rAKccfn/UMR0gqSZ9/Px4swcy57z8fJIE
X-Gm-Gg: AYBFou3R9Pla9zaqaftG4kgfD7tc6XK+ruyyc/uQ6uxUT6BVJE3JCJm22KNdJVWLtXh
	MFqRx56DEvMeXo9YBKfLZMGynCYrwOPuL7Kp/27m7gwXhtQQ9QlfXS9xcKaYhU6tbjMKmgYOVXA
	TlHMRnff64ycHVryi7VGynB7k8HaAg5NyuK3iRPGdGhYSoDwQ2qQJH1EKDKLU5GHSCVwYzkkJns
	zzzbCYi+vBWLTnIDMSigfEmOrjN65sHkuSQFK1q7OodO24mIJ7BGk43asrfUxczCKPJyBMcszFc
	tUmkyW3GhBO7yyHdq9eqM8hEE+Rp77meBAQWFfm17yRPrmsPijmSA/kpHOW0WHOEfxMf9NW4EcW
	16nraQ8w7GfC6WQPQl0/Q0VN3TI7c+Mf4jsv+rt4nLAmMAKoZ5tlDNEByt8uZoSEYS3HP0hTFyM
	QmF2JhhxV+gZEwfej15NogDdFS/eeO04jpP63FcLH6IlGMOYbh6INLGXs1Yu1nZLM2DJIxzP4FR
	ynFmFttV08sx1j9rRjc+mtCD36tnyq3BDq/jJjPd15U8dxo2AP6p9+P+T06xU3z11v2pA==
X-Received: by 2002:a05:7022:f511:b0:1a0:5c85:d1b3 with SMTP id a92af1059eb24-1a05c85e6damr5681820c88.43.1793043191140;
        Mon, 26 Oct 2026 12:33:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm55689859c88.17.2026.10.26.12.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:33:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 12:33:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Remy Demangeot <remy@demangeot.net>
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (asus-ec-sensors) add EXT_Sensor temperatures
 for MAXIMUS IX EXTREME
Message-ID: <08a1e24a-2cf0-47c7-ac10-c58ef70f0614@roeck-us.net>
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
 <20261026-b4-m9e-ext-sensors-v1-1-644d389b2de1@demangeot.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-b4-m9e-ext-sensors-v1-1-644d389b2de1@demangeot.net>

On Mon, Oct 26, 2026 at 09:57:35AM +0100, Remy Demangeot wrote:
> From: Remy Demangeot <remy@demangeot.net>
> 
> The MAXIMUS IX EXTREME supports three additional thermistor inputs,
> EXT_Sensor1-3, located on the optional ASUS fan extension card. The
> EC reports them at bank 0, registers 0x60-0x62, as signed degrees
> Celsius, with -60 when no probe is connected (already handled as a
> blank value).
> 
> Add them to the Intel 200-series family as Extra_1-Extra_3 and enable
> them for the board.
> 
> Readings match HWiNFO 8.54 on the same machine, and moving a probe
> from one header to another moves the reading accordingly.
> 
> Signed-off-by: Remy Demangeot <remy@demangeot.net>

Applied.

Thanks,
Guenter
