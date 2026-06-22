Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23196346FDA
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 18:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154595; cv=none; b=BD8vpJMtV7ldFCWWxnaMly/rSzXwALFCTIfWAxCbyGW3cLRkrqouLtBCJgWZlY6GDO+Fg3TXzDqzElxTPKk84DvBtP7Mtf6Bl34zPtibJ5JlY2081FLQrX+4838sJ2LEVUAOIg9VJlaNZ3xDIl33z10m7F1ONCKd8pRxUKq9mq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154595; c=relaxed/simple;
	bh=b/5AxKlfDLljDsOspE5bNyi8aD14GKd8wsmsXO7uUO4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Zz1aaXnrd3WUIDrq6JHqG2ql0r0Izp0u3ktfQgbKtzV5qLXbS5vsB2TUdtfeCyaJmmUM3qZoz0gQRKnMa5lkI+8Hg8cyrkKapH4xOYa2i+L1TB6LcGZLRxy5yhSUTDTXn+km+BcxMpRQ5ewqjWV+y0vJpesFXYDDyWEjWKLmB9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3EHu3Fu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3EHu3Fu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso2073595e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 11:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154592; x=1782759392; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGuX+WBhfDluwNW0VRTh1DIO03lIg15lXv1EuQn3pcA=;
        b=o3EHu3FuGVLJy2NdSRuaJIUlCIQGi10Gza8g644Ko9vPVRpc+bNR3Za5emoJo4XUwG
         9a+SOPj8puD57apqDOEwPdKj4sht6FD2qxr2VEK7iYwVyfs7qJs3fHFQdSuWnL15VwYh
         swqUZxrGU70WWDOzWWjtUVIyfJDtd3he3E0L74EkyvuMPdErh9ibROUQ3EmyRV5xASeM
         3iyinrNuuQepNtCQtHINo2M7+m82tc13GjYDDnMnbDg6LYMh/hyrVle10hKMgWgJYD0/
         Goft9siQnnB03S92e7UeIGq+l6yYTYlhFGlZ2rDf9zhKwsND6Ai3uZjHixTr9IbGa6l5
         S+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154592; x=1782759392;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGuX+WBhfDluwNW0VRTh1DIO03lIg15lXv1EuQn3pcA=;
        b=Ur8ZuLMW350/EmGnkaa+9qsutVGjI05tMrJ6NPh6+0W9th65ptCYY9881DG35cKRb1
         jtgGSCDzrYXg1+l9UYu/aarh8c16K/ng4J9tIE+RapK1C8vUDOiddDFhol7cm734Hlw5
         4Uqnpreg2Zuo6cuJvCLpWBEfe4eQFam4wz5h/2ajUaZ6dv4u4PyUvg+jJiXNEUL04aBf
         auTBnM4bfNUSDMTN4XAQmAYf3Z9yOiNM0dCtjsnE4R9xTzAmlMHrqoZ1sCUAoLCjgpe8
         hkMdFmJRVjkwr+5DUDRzoGCR5iWbyLYGaK2kWaUCrnwodzkhP0EOy+04KqrUY+8LvBmJ
         Y5gQ==
X-Gm-Message-State: AOJu0Yxttu7kzgkMEwdQH/WYSySzDUYFY0Ul0U7Ei+WMnN30BfNtUg06
	ApA05s1z5YErfzfZqADZYW6emz3rUvnBuMaHHcLbm61Mq4XUcYgF4Z9MbZ1GzwLF
X-Gm-Gg: AfdE7ckS/fgsayIgxziLSRSzZE5pPGB5ZpZpbTYyvJjiTfqeSKkE8VQomM4RlQN7XIW
	DFZWs5bUjhJI1oO1sswF5lKarGcVlAAkXr6xs178eX3W/G8Et8iikP8xGQmLRHj0FGnt2bjVwPe
	7JO2aOLt2EqYbgAS6KuuvBhxioxhZWAwuiXPS7/eyov6V9TQxSOGtpPFHCgDkUGDX0IxECPX/bR
	E0JR4R+JJt2aJpUPpoL5gGlg59iNMyaT5JocqgM9PLkuHIGD2CLocLZ4xZsbaKmZlfu0i87ZQuZ
	JT5TlTxiZv8VdBYkSoMctHpi0BHcOIj7snPKBMY398p9kWIjoADWSOsNxMCpKec03gFOzekJhLh
	o58Gwrfd1jzfQnL3SDJdab5v071/BaXRYnFeNysDqY8umBgfPxvGdYrRcLHtt7m0rEquZxu8Hnk
	ZRR2lLwu1MrG5hPJrXMB7aCCHHvQ==
X-Received: by 2002:a05:600c:3e0a:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-4925a0a9ad9mr9493665e9.6.1782154592309;
        Mon, 22 Jun 2026 11:56:32 -0700 (PDT)
Received: from localhost ([2001:4bb8:19f:d19a:c1d2:e9fd:1b2b:136b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49245bba787sm193141475e9.1.2026.06.22.11.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 11:56:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 20:56:29 +0200
Message-Id: <DJFT2RVYEMKU.3UA5K39W4GNAQ@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: chipcap2: Add label property
Cc: <linux-hwmon@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Flaviu Nistor"
 <flaviu.nistor@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260622122200.14245-1-flaviu.nistor@gmail.com>
 <20260622123206.593E41F000E9@smtp.kernel.org>
In-Reply-To: <20260622123206.593E41F000E9@smtp.kernel.org>

On Mon Jun 22, 2026 at 2:32 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
...
> Pre-existing issues:
> - [High] Threaded interrupt handlers modify shared state without holding =
any locks, violating hwmon subsystem guidelines and causing potential loss =
of alarm events.
> --
> [Severity: High]
> This is a pre-existing issue, but does drivers/hwmon/chipcap2.c lack
> locking between the threaded interrupt handlers and the sysfs paths, whic=
h
> could lead to lost alarm events?
>
> The threaded interrupt handlers modify shared state without holding any
> locks, which violates hwmon subsystem guidelines.
>
> If an interrupt fires between the sysfs read and write:
>
> CPU1 in drivers/hwmon/chipcap2.c:cc2_humidity_min_alarm_status() {
> 	...
> 	if (data->rh_alarm.low_alarm) {
> 		*val =3D (measurement < min_hyst) ? 1 : 0;
>
> CPU2 in drivers/hwmon/chipcap2.c:cc2_low_interrupt() {
> 		cc2->rh_alarm.low_alarm =3D true;
> }
>
> CPU1 continues:
> 		data->rh_alarm.low_alarm =3D *val;
> 	} else {
> 		*val =3D 0;
> 	}
> 	...
> }
>
> The interrupt's update will be overwritten with 0 and permanently lost. T=
he
> hwmon subsystem guidelines require drivers to implement locking for inter=
rupt
> handling and sysfs attributes, recommending the use of hwmon_lock() and
> hwmon_unlock().
>
> Could this concurrent access to data->rh_alarm.low_alarm be protected?

I agree with Sashiko's report about the concurrency issue. If an
interrupt is triggered right after checking data->rh_alarm.low_alarm,
the status would be 0 instead of 1, if no prior interrupts were
triggered.

Sashiko only reported this issue for the low alarm, but the same applies
for the high alarm, which is independent and has a dedicated signal.
I am not sure about using hwmon_lock()/hwmon_unlock() for this, as it
serializes all kind of accesses and not only the ones concerning the
interrupt status. That might add some extra delay with many accesses at
the same time, although the fix would be simpler.

The most optimal way might be using 2 different locks for the two
interrupts, as they happen in different lanes and don't share data.
If that is ok, I can prepare a patch to test it on real hardware and send
it upstream.

Best regards,
Javier
