Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5047980C02
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Mar 2025 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567603; cv=none; b=aIeiWcxFLRzygNFm3pKKu2SEG6R7woV9smeKbpiHFWD55+/vkWMufmJLYNNemzTyst263PT9dCRou6qc6VW2hgPCWHGFbS18lvSEK7tgDWi+omqamZBnQA0yWQ+xPUr3V1IwSWsWHVse2CSfeKCDXI/Df4K7ANuEtbXG2Mdk0Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567603; c=relaxed/simple;
	bh=QW4cJckpG5dsFBolJzYUPI0/ujHzXZViu+nU95169Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFkiMz70bq0x+wB5S3ndkJ7s9tbD9K1advNU4Rukv8qAYShJVcXJgIScQipKif3RCisi00UN4JVEIlikpaAK7jMtrd0cNGrmcZXEMdINbngkGytxNaxKfoQ5VIfPuD+loxye9nk2vKXo0eyHIXqM1MIF8kQFfGmGwnOnM3hU6FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oEyxAcq4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oEyxAcq4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so16692145e9.2
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Mar 2025 07:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567598; x=1743172398; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EbWhjmUFxyfN2qMw5Fj6z4IWbMUgKzCZfAKdA8QCVNM=;
        b=oEyxAcq4bgTm/3LLXZjQQYpM2Dx5n15sYsqbGP4g6ApswxKnyqtpy3waGWGPrGRQxM
         d2VMjDAtm53jbriVZc0jCJl2yIhGZCrPkT0XRQ0BaIS2f08CWeVFotKvOkAdWuB+lPky
         QsUsBVB2eIkcwzZ5dbDqPrQ+92sDLU5pLmASKIX+oijbHYnAlzica/NMZ0DEspFp0vC6
         hZVpIbtDzvi/rwmaA7LLeYi9r81lGkprlhF+fwfowFAoKm4e3yfd76c+uz4Sg5JskYHJ
         LLgWDlqme4y14Zd+2KTRMdcBemA9Pr7Kf6dE/0NhnaSTpvdObE5O3SZNTq2jkx+JEAob
         qEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567598; x=1743172398;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EbWhjmUFxyfN2qMw5Fj6z4IWbMUgKzCZfAKdA8QCVNM=;
        b=Ts4vEMaz2Ev2Pf+gO6ZCYMZR4AuXPdOMZTcIRWiOpQtD5iZ9u0Gq9xC/fUXYEkP4aB
         9aztByF558uyFYdAr9UK794dJIUdEPEBuhkZoFzysB18LFe1Z53evPkfRJJfE5ZmyaNN
         U3rK5NWxDFSx7XEWOukVjxYYZ9HjQULp1QY7PfjDBNkz8maCqz6+waI9K5SKlhI1nSSZ
         KgEPaypBg4LEtQkTbb/I49xrtQW8DH5yvakh/84tHD2ZDjw9jUJevL55tlkEhxmgIVMX
         Zi9VRePGUkSoWDeZMT06Eaxc/CDDkvnBbzw/pLGnE16So997aoyoen9ob8bN1zFvtIQe
         z+7g==
X-Gm-Message-State: AOJu0Yxin0dsudLIELvf964A8ohsc4ZAYtS/zjjbJ7jkUSXW1P+p539O
	GEoUzn8MM/NXaq+Hn8tj6ISSNT4Lr1l3a3FFwTK8Id1NeBEx1m3/LV6saqs9nbo=
X-Gm-Gg: ASbGncsTsWPDKWDcOro3X8Wv7+st3Zzw5S00xJGsFoSP3OAsNYIZGFWCS3g0tijA/P2
	lQWy12Z10OI5cYDnWdM/wuVWZ30Eb9949WSGp4Rj2sS0pGHnPdwV2RQQkm6ZSGmLd0ViMu5wAvC
	xft+5KahXXSgt7XmmGpwnD+fLBYf0FE2orGE0+K5SHNlixn5EOFOLJw+LOcYnMUpdeA+9FGszl5
	sUyuAgtuLaJMAHU2hDPsYA5PjBXVdIJl7j4MXe9Mh2k7w25FCfVsJmELioW2nnCGKb26k2ketUm
	TN5bbdxpWZmfXTAmvmLKTao/UK1v5GbkWHKcNdUfx5MkngeULj0SxZMTqU9b
X-Google-Smtp-Source: AGHT+IHU8ncJgsqaXj0tGoHuTnC1pZgx4iORNc3MWJYiTnMwYUFMAMCz+TWh6hFmRm/3Q0xNW5isMQ==
X-Received: by 2002:a5d:47c6:0:b0:399:6d54:25ce with SMTP id ffacd0b85a97d-3997f8f9cc4mr2698999f8f.7.1742567598476;
        Fri, 21 Mar 2025 07:33:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f934812sm2554206f8f.0.2025.03.21.07.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:33:18 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:33:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Huisong Li <lihuisong@huawei.com>
Cc: linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: (acpi_power_meter) Replace the deprecated
 hwmon_device_register
Message-ID: <09675757-8507-4c4f-b143-2212a8f287ce@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Huisong Li,

Commit c812cc42f92d ("hwmon: (acpi_power_meter) Replace the
deprecated hwmon_device_register") from Mar 19, 2025 (linux-next),
leads to the following Smatch static checker warning:

	drivers/hwmon/acpi_power_meter.c:405 power_meter_is_visible()
	warn: signedness bug returning '(-22)'

drivers/hwmon/acpi_power_meter.c
    398 static umode_t power_meter_is_visible(const void *data,
               ^^^^^^^
This is an unsigned short.

    399                                       enum hwmon_sensor_types type,
    400                                       u32 attr, int channel)
    401 {
    402         const struct acpi_power_meter_resource *res = data;
    403 
    404         if (type != hwmon_power)
--> 405                 return -EINVAL;
                               ^^^^^^^
Negative.

    406 
    407         switch (attr) {
    408         case hwmon_power_average:
    409         case hwmon_power_average_interval_min:
    410         case hwmon_power_average_interval_max:
    411                 if (res->caps.flags & POWER_METER_CAN_MEASURE)
    412                         return 0444;
    413                 break;

regards,
dan carpenter
