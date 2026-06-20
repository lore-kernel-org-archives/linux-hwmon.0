Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83EC2E7185
	for <linux-hwmon@vger.kernel.org>; Sat, 20 Jun 2026 18:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781979939; cv=none; b=piN3obewK47EjL45MOKkj7mwI3u3vVbtCKG4M+dIw2MKT/jnT2JFB1owHDt9YNRXjUTvlJUXQyURPIJFzJhb5FG9uqiVCyN06uEepaqkuB2TekCE+aREGVJ2rZSENoPdy5Tf5l/e3Z4OLLJWzRlysAcPt2HoIBhrF/f1uUf71sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781979939; c=relaxed/simple;
	bh=2Rsilpwk6KHwVtLI9Zu3QvzDBwqLkrR7IZ54Axg22S8=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 In-Reply-To:References; b=Z1oNhKq9hM5PtA7niFMSDKNI/smkOqLJ/JeEn9H9xbBiFmSjCokseF7n0//JSSgxmCpMD9fFSJjEWLmX0qSEZDjEcVcrXzgQDHHlhzlXBAolH6uvCl0254Z2zR4oAPtCI0aKWvHoYhAMZQhnnfngDtBo4DRCXu4ABVQn7CnaGt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=fail (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QyVtxrNE reason="signature verification failed"; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyVtxrNE"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bf854d5feso5608964eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 20 Jun 2026 11:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781979936; x=1782584736;
        h=content-transfer-encoding:references:in-reply-to:reply-to
         :dkim-signature:delivered-to:to:subject:cc:message-id:date
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Rsilpwk6KHwVtLI9Zu3QvzDBwqLkrR7IZ54Axg22S8=;
        b=m8+unhrhiOnHCuRboDTRcbe7vYmz/J6ysGkXRPKP1aSh4doCJZSVFwlH98bsaB5wUD
         bJPmDBsQrvyrGkB6xMPKVuq2Xjys1+RQO0hK4fTgV5Iiv46INuA24XjUhVxc+0bmx5mR
         Z6/dBj6n+hYha7y5bpuZ08z3bwgAPk03LXC6graCSbH+u6pXp1dpBXGLqFS02pMh43T1
         Gsw6or7wWgQM91gT5E3eIXH+IfxBGdnVN4v2a3tAaBqR5eM+xCEJcP15nBsT47Q9X6ap
         +WFUkn4cRuNT5vTuz9pe+4tkOJKG17EEReTl37tV9GWMfnK8Fw4vgt5IL6BxorOV9EdP
         AglA==
X-Gm-Message-State: AOJu0Yzx+SKIIuLmHn4LbZxVGulMpc3y7Ydj3h8OWR9do6nCpW6ynjLI
	DN4bTc4FNLDx78uBuyv5sBWLjm+XKxt7GeopjgqrtASaqsJN+91oxsvjFZhhH3v7HZnWQGySeaF
	A2eQS
X-Gm-Gg: AfdE7cnzo/n4YjO8e9AlSsNZbhi7xs9G2Cg2txsKU4RVS+1AcUOsAns5cZ0d0Lo5fHh
	/zwUIqn0UzGX9GEmM7guPV0ZnYMzrSK3lD3+5QwMNDpzlFRC30o5plGeE5RbljwfEO0YPKcGLL8
	cHtFYbw6JyY3xj+mLiA2KzecdSR3HLE2e7Jl4Y+wc1AnZ6Xt0Y1BvKt/ndXtfGcOaYFUyaCIbvZ
	fQrZyH/FOmdxzEIMIj3KtQ7mt7gILQBS98QRrN1fSju1/TVApRCsAM1Zd2Qts9Dgsiqjn9oJ1QW
	S3u1YkvNlNr8HWQ5aSllU4w50xGdVmgDvlF16ujjDJKdIHNsHr+yO+lH0EHBMcX1Kp+z0ydj847
	kIb8z8sg28jAz4FONQZGFG7Nf2MpW54Hl5wMxXZGiwgpR9NrvoWvN7QDq6bT8qFNPaVncX7V3ee
	pSKJHOheBVnVIN
X-Received: by 2002:a05:7300:6d2c:b0:304:ab8:f899 with SMTP id 5a478bee46e88-30c0701f009mr6152896eec.8.1781979936460;
        Sat, 20 Jun 2026 11:25:36 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be4b24esm4300990eec.27.2026.06.20.11.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 11:25:36 -0700 (PDT)
From: abdurrahman@nexthop.ai
X-Google-Original-From: <sashiko-bot@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 20 Jun 2026 11:25:35 -0700
Message-Id: <DJE36102E7LQ.1YJVL85XCZGZ4@kernel.org>
Cc: <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (pmbus/core) honor vrm_version in
 pmbus_data2reg_vid()
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Received: by 2002:a05:7110:719d:b0:327:fec2:456 with SMTP id cb29csp777070geb;
        Sat, 20 Jun 2026 00:55:52 -0700 (PDT)
X-Received: by 2002:a05:6214:19c4:b0:8cc:10ff:cebc with SMTP id 6a1803df08f44-8df8ef47a62mr49516036d6.7.1781942152718;
        Sat, 20 Jun 2026 00:55:52 -0700 (PDT)
Received: from tor.source.kernel.org (tor.source.kernel.org. [172.105.4.254])
        by mx.google.com with ESMTPS id 6a1803df08f44-8df8313837fsi24237316d6.396.2026.06.20.00.55.52
        for <abdurrahman@nexthop.ai>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 00:55:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of sashiko-bot@kernel.org designates 172.105.4.254 as permitted sender) client-ip=172.105.4.254;
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56A24601E1
	for <abdurrahman@nexthop.ai>; Sat, 20 Jun 2026 07:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46B71F000E9;
	Sat, 20 Jun 2026 07:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781942152;
	bh=2Rsilpwk6KHwVtLI9Zu3QvzDBwqLkrR7IZ54Axg22S8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QyVtxrNENus2oWaqrwdn1Qj6HU3usXOTI5GxmuR7zdj1/Usvn0uvq2tJSv+G0I08X
	 XQCQvBr+aZvvGyd1YAAzOjMgOTbiWFw3i7SjixQP7tGZKQMxRtpuajh621cyefjr2B
	 gYayaYcUiM7JruJtQSYV9W1dK4rSscc7I18bc6AD+cYRH34L8ufJzapGxSHPZYo+EJ
	 NY6hAIOVzVdlaUS3/3dX0/Vqe1R1KZftM3u3jtMcT1UOq81DiklGcn4xDlwIoaMOKA
	 ubcGOod+18ilxV4mKdDQ0rAepewa5XN1SYwleipDV146qPxGC7JdOUSrK1SfU1oWRy
	 w3+xfuS5K50lw==
Reply-To: sashiko-reviews@lists.linux.dev
In-Reply-To: <20260620-pmbus-data2reg-vid-v1-1-5518030432c4@nexthop.ai>
References: <20260620-pmbus-data2reg-vid-v1-1-5518030432c4@nexthop.ai>
Content-Transfer-Encoding: quoted-printable

> pmbus_data2reg_vid() hardcoded the VR11 encoding regardless of the
> vrm_version configured by the driver, while pmbus_reg2data_vid()
> already switched on it. Any driver that selects a non-VR11 VID mode
> and exposes a regulator (or hwmon vout setter) sent dangerously
> wrong codes to PMBUS_VOUT_COMMAND -- e.g. an nvidia195mv part asked
> for 200 mV got the VR11 clamp to 500 mV encoded as 0xB2, which the
> chip interprets as 1080 mV.
>=20
> Mirror pmbus_reg2data_vid() so writes round-trip with reads.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620-pmbus-data=
2reg-vid-v1-1-5518030432c4@nexthop.ai?part=3D1

