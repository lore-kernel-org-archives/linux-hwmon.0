Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9964A9D7E
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 16:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265923; cv=none; b=ckhClrUXmzTIUh5p6Fil8H/hTN8S6mnzU1jHtWbt8rIQXUxAWSXQqya7b59QFzO4J82cy7BfByxdemaLxApQtyjMs4d2YSilM7Nbql99agRvxZcHUbRlnJwr2aD6UWdXp7eWrRYa8KGZXvjzWITDV+A4fPg9xl4th18+S16PTuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265923; c=relaxed/simple;
	bh=ikXMgmXHONWXYFYrMoc05cqE3qRXFvvliZBDSOJzrak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrTXVc34Hwcrf783shjqqqejTt4TBPyKHGKxsF38kLx5z/p5DDChbSG4BgkaWqw5p+431K1HAlRql47YVgaAxQFLnlaTSQV1gcr+YbRlUygNnemRErqpGTFwlVEiityf4A8s53wPecr2Wgn7i6w8qoy/n7IM1nWf+f0htdJe17Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jR58+ES4; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jR58+ES4"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso1075431a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 09:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265921; x=1790870721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0MSHTGjNK+jZgiSFsmQTMaSs2OTjPQCQBd2UwSTXfYI=;
        b=jR58+ES481tNIBZMkFyT8Cnhz8Sq0hacKrg8PBI4sD4PqF7NFzUBRE9xkBZoZH29IL
         qX82KTmFLAL034bwG+8k/nruP/bBdhC/E4l+8r7vdTwbvVPjiacFVemFkumfpm+JS9TH
         bjHEuUmmbeC2PK7ZxJ7ewYJswwxyWNqaVyXVDhEOBq2sgCK9BRVzd25kXr5y7VKZd4xK
         lg1hKSX65O+gwmMzrAz8p48NHSa9xDIaOZQ2Ed4ijfcaxd/B6Q+089af5Zg8uGxFSTKo
         QTucBGpkBG1iybK8rtlCZq4vAJx3gdXvcn9+dIMhpj0t1GnxIRQoxGEycr7KbiDvZ/ZA
         sejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265921; x=1790870721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MSHTGjNK+jZgiSFsmQTMaSs2OTjPQCQBd2UwSTXfYI=;
        b=Q2covr+dV7wZleBdTZgzqlNzXx3KuMPVYeqvl6qyiIyKW5ighJKMHslGVJ9kUL1Gk8
         IW0534g9JLSJcME9/27L8nWSW8x6M0xhCma5yLfz25Ktw6vyPCQJAkBPsgvUoIPzeXiP
         zH6ZwXt6dK5SGBylPZN/fiCq16gk/Cn90tYpBeWSGFrAjv4I/r4uC0zOF00OkBzgAlUA
         nwCVpMkwa2U5JBJUgab4EG7CrkIvfD1pr5TxUiUI8Fw56DFH6s/VZLhpZguLQehC8INN
         OtUYtOISJEq4BvQLJoRdEFlD6w4aY6yjzYj6fIzEPJgq4rbTxoeALCcuecei6kgWvn8o
         kHng==
X-Forwarded-Encrypted: i=1; AKwUvBwFvf/Omgr/PQw3dHj54OcS2UBnJPLRba+K136+H9Y9RVclbZJXsR3ae0/H5wXV8dfnCotMAAiBEOM6CA==@vger.kernel.org
X-Gm-Message-State: AFuF++n7AAMqSnlni9iYorQWm87Myi0Oic03Hm+Nsfssgr30doZYuMeQ
	ytUC4m5bzA4K5N0+BBQo4XIXh++KDoknOMQE0AbzUfKJcmY+42CcNP6b
X-Gm-Gg: AYBFou0xbhRnQC4CQjr4/Ddkc8SKOPQGJim5muGNZsokE0GvCgh45YAfSOWJv/YJBSn
	zhBx0AuNIIF0fkGsWvP7rXb7iGI/cT8warx5TTJ5K7hYXLmHSEc2FBygo38GqwUXlFLYelSnX9v
	F8uXEwAlG87vRB55Iq8FhSvQLjOcbhmWvBvAnziM0CU6ngAnxWhV5kuSzP1i7lnuU5oWIISZVyZ
	FX2Oxq7a6ZP3029pX35ia+s8C5kkXDG85VrsJexA8ujuV1E2mrOMcNh/cLBzkBPVBaF5SLTV4rk
	QIDz14Qcfeoz5PGf5OIUvEe3Bn7aC/L/5jEpGKT2mRLBeT4jLLB8OIKuRsKJsDQ40JphWrHBMdY
	ztcKT+N9zjNaWmSaJd44ZxmQi1oIg0qZPejX7ijJoTkAejcg6FD42zdSPy3yKXxqXSKg9Qf/MhG
	3wnM6Uvg3UT722Iawcpgg4Cg9jy6hSQkjCt80XkC5WjsuJkpZrk+KYgE6074sPqD/KgebWS5MXj
	awmyQvOSe9d
X-Received: by 2002:a17:90a:b81:b0:3a0:abc3:afb5 with SMTP id 98e67ed59e1d1-3a0abc3c2a8mr650385a91.34.1790265920942;
        Thu, 24 Sep 2026 09:05:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3f5e79sm2965662a12.25.2026.09.24.09.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:05:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 09:05:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jiale Yao <yaojiale02@163.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aquacomputer_d5next) reject short status reports
Message-ID: <7b40ae2e-57d8-44f7-9791-ac65a3e97290@roeck-us.net>
References: <20260924151121.1233666-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924151121.1233666-1-yaojiale02@163.com>

On Thu, Sep 24, 2026 at 11:11:21PM +0800, Jiale Yao wrote:
> The HID driver raw_event callback runs before HID core validates the
> received report length.  aqc_raw_event() reads device-specific status
> fields at fixed offsets, including multi-byte values, without checking
> that the received buffer contains the complete report.  A truncated status
> report can therefore cause out-of-bounds reads and update hwmon state with
> data beyond the received report.
> 
> Reject status reports shorter than the length derived from their report
> descriptor before accessing any fields.  Commit 47669bec44fe ("HID: asus:
> refactor the two workqueues and init sequence") added equivalent raw-event
> length validation to hid-asus.
> 
> Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/hwmon/aquacomputer_d5next.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
> index 1ca70e726298..1ebc8bc4c090 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
> @@ -1331,6 +1331,8 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
>  
>  	if (report->id != STATUS_REPORT_ID)
>  		return 0;
> +	if (size < hid_report_len(report))
> +		return 0;

That doesn't ensure that the report is not at least as long as accessed
later in the function, and thus does not fix anything. The same applies
to the other patch.

A proper fix would be to ensure that size is at least as long as accessed
in the function. hid_report_len() does not and can not know that value.
It is purely driver specific.

Also, the code added in commit 47669bec44fe is:

        if (size < 2) {
                hid_dbg(hdev, "Unexpected keyboard report size %d\n", size);
                return 0;
        }

which makes sense because asus_raw_event() never accesses more than two bytes
in the report. The statement "Commit 47669bec44fe ("HID: asus: refactor the two
workqueues and init sequence") added equivalent raw-event length validation
to hid-asus" is either hallucinated or intentionally misleading.

Guenter
