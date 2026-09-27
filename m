Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024D53EDE64
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 12:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513245; cv=none; b=TjdAd8+jYKvqh3ZxgkY/dPMQoQ2H2sRQIRerb4fjiazEDJWRbVtFKoYn5CFRsIwGRLObGIyS82hhoy3bTkrhKy8pWCRBDN022nneK1MZat/WcLCreHYoyd7id9H3pjaPL0Zlqj6ly2ZsWXtUP6I5NhwyP71OFkVh5C8C5hoX0F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513245; c=relaxed/simple;
	bh=OzC1ipp50gKSQmUI/wHay6GiqAVGkfRrDG+NGkkq9Og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBY5DLzPHZ18HH3tlNf7d5FTjAEWLh/NzFKUyk0Ti7/2DhkAA8p32jEM/jK9lWso9zoMKGUaA1d6a8rApy43sIfeBCCT2wHj5FOG5P6tUuSOid04EaJXu5+8mcq/mfEQoHeEjxzDJLe0MISozaR1OUe1P3CyHpvHbgORJaszBlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX6ERCYI; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX6ERCYI"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so23853756d6.3
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 05:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513243; x=1791118043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgI1lTx79u03eoJMlNZF3q2Q8hZET9tAZCH2sXH27JE=;
        b=EX6ERCYIvNT8wnwl1AMeIJf8RPZLZPi/du0+3K9KeeEgXGmDw6cRmDztpbZqa/oBFb
         GZFNNHGbaJX7pDsflzWLgMDbuvgXnOrBgt96ZH3rOiOJjjOM1dkS9plT3aOPB87gW+QI
         QD1k8Fq9NYsEazTai9vmiYloUcx6nrw7ZCHDvN32kgFVW+PNW+cEP31gDzxz6BDli6wj
         snmdYkUFpkMfMi6z5qZY9FlXX30guFhJESm1QWcRro0JFuSY7TB1PD8/um4KhFkXPZPq
         9WeYI2qITNS0p3Kgu5ErzFxwrnZYmu6eSS5cZIbe3E0lXQ1V33lcKD0GF3Wqmyzj9rIN
         RzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513243; x=1791118043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgI1lTx79u03eoJMlNZF3q2Q8hZET9tAZCH2sXH27JE=;
        b=KOrT7sul3DINL3bAV5OxktFlJx74WomB1YSsVSgwzlWffaBgXcC0S+aUO5J4gDSzrS
         vGZG+1RI78l0W/BzStgNXkMPIUP6UgqYwWKCwtK77fkoYQu2E0YaW8VLrRjOwdVyJKGj
         MD88Y1Di9jSmqDQ72I90MT5khi+SMbYBRQwOPaOenn1W09v2jl+k6qYTG4+c2fOCSg9B
         yRyMKRLSoBUqFGvwGEBx6NM5CT/FIQ+RaEjjx16kE5M95meudU4HZxEB4wLzQVtS0act
         sch0c7k3dSZ5YCpnHv+9txiXnX6xfM0vcEXT7wDAyexmdKajzQNnlsjpugvVepo5a/Pm
         jagA==
X-Gm-Message-State: AFuF++lMvhqmoQBzC7k2aNZ49ccW+u6h9lhrBGaW0/zwzNXnAUKoWWFy
	t/WYg7mLd//wIvlTKBhQMo4kG9A4sHZ5/F5JMPSgVDtwItcqKHKwc1AHpuURJtrglE4=
X-Gm-Gg: AYBFou1+5IWimi0Q4eQynrVR0dkw15Ac0rso4xloiM4bkVnkJUmBcABpwQYdr8geg0F
	jN8+1Oprmm1WkzgSpwiDww4gQe09TCjbnJ3mXKQYQCIByaJKYNBfcZ0xqPneHdaLnoBH2P1oFfv
	5nn3kTo0dcVENYQjToAVsrCllDP6lyK9gkU4AJPKrdD3HY8PNhhSCoPLmOdLQogCUBBC0y7qSzy
	b55goQuhlPD9ZVSYWsQfYiowYCIdBndpuLkRfRUJVJXy4HnngN8SQqeAEw/KxiszCZx5qP9AZee
	JwAVH9wVdGKBTdqFGat9q0gNh6aH4Ntm4WkHpuYRTqfB9f+DVeENpmBB7wmiFKn60kXSt0YIM49
	OfrdVsi3uF+S0LEMC4E3gWfjcX0TpsfgK4UePG197zJLFYyYf2LpaIaE+IJx3qJq4fPlkh8EpjU
	BDfFrNeFPgJ4WPM5KzXUwl7zWueLZgzRWxIrRweTm75OyZiGtU0on1H1hvBuf933H30rW+WCjTB
	zi06RvROQ4yVr0BFPEDbOQZyikBjpIkc1RHLq59SHnjVXluu+AF/UUh
X-Received: by 2002:ac8:5f0e:0:b0:533:34ed:1956 with SMTP id d75a77b69052e-53334ed1b61mr53236161cf.14.1790513242878;
        Sun, 27 Sep 2026 05:47:22 -0700 (PDT)
Received: from Z-System.tailddad04.ts.net (c-68-83-199-219.hsd1.mi.comcast.net. [68.83.199.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332225b709sm40569201cf.13.2026.09.27.05.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:47:22 -0700 (PDT)
From: Zac Lanzon <lanzonza@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Edward Blair <edward.blair@gmail.com>,
	sashiko-reviews@lists.linux.dev,
	Zac Lanzon <lanzonza@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (asus_rog_ryujin) Add pwm1_enable for the Ryujin III pump
Date: Sun, 27 Sep 2026 08:47:11 -0400
Message-ID: <20260927124711.151260-1-lanzonza@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927121932.72AAE1F000FF@smtp.kernel.org>
References: <20260927120927.72810-1-lanzonza@gmail.com> <20260927120927.72810-3-lanzonza@gmail.com> <20260927121932.72AAE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 27, 2026 at 12:19:31PM +0000, sashiko-bot@kernel.org wrote:
> > +	now = jiffies;
> > +	next = priv->source_changed + msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_INTERVAL);
> > +	if (time_before(now, next))
> > +		msleep(jiffies_to_msecs(next - now));
>
> [Severity: Medium]
> Is there a risk of a massive unintended sleep here due to a jiffies
> wrap-around?
>
> On 32-bit systems, if the elapsed time since priv->source_changed exceeds
> 2^31 jiffies (for example, if there are no source changes for 24.8 days at
> HZ=1000), time_before() can wrap and return true. This would feed a very
> large wrapped value from next - now into msleep(), causing a thread hang
> when a write to the cooler duty attribute is attempted.

Right. v2 computes the elapsed time with an unsigned subtraction, so the
wait can never exceed RYUJIN_SOURCE_CHANGE_INTERVAL:

	unsigned long interval = msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_INTERVAL);

	elapsed = jiffies - priv->source_changed;
	if (elapsed < interval)
		msleep(jiffies_to_msecs(interval - elapsed));

Patch 1 has no timing code and is unchanged. v2 follows tomorrow,
retested on the RYUJIN III 360.

Thanks,
Zac
