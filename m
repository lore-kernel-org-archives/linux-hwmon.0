Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C0241F5ED
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576171; cv=none; b=EIUvHbrZpUncS1IBB82ogWB7oh09QPv8RqGATX3F45jn+6Og7t0jw+NAjOatvSfwOQwS29rG6VtY0iQr4yiXUUJCvIZRVj+ftAI31GuqFBeZ2fJqIfjB5CZIyXs3Z667t8Cjl9DXnt2j5hBfJLbXHstEKgpelt+nxAWiHNHBB/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576171; c=relaxed/simple;
	bh=aAkUmUWkJjkogdiY/Lr5ftOnod7lse4jtWkhmBZtULA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W3i9f30AWVsMqSqV5vYseB8bulEo7DG54JGTtRuI9v2vTH14VVw3/qfMSfV3nc1ASiyITwWA0dILkY5WhG6cLXIMnYwEgpitCEo7Jb7YaGWIwOOJxgz8hTiYarKgsncX7lHSzy0hbdgNFhyqruwDBj8s5YUeWQkz2d6mjb16tO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJXyZ3t6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJXyZ3t6"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d53197d8b5so33206315ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576170; x=1788180970; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qrOeCrMQEmHYylUm4A3w4i35ISZfmuGKPCvdC4iGLxM=;
        b=eJXyZ3t61lJNq1rT5N/8klvOM9bOjcFwIApBDO0YMWW8PBsirudaZVAxutxJS96/ew
         tYG6h3Y5PKbCuQ2sYwgHgqvQaSRXE82Z5FdNYkVNOsNef1URVHVSq8MhoqgtgrHurXpR
         7jiQQ3ilR7UicoBwBb1adTkm8u8/fidxgNPvhxdjnrXtFF/Vt2mfxgfQQlrFmQzXmVYR
         GH/KyM/sL78axzY71gjmeDkOUzLiY3Y8ONkiXlSez5v+4FqHZ2HS+rgOqobIXJpy9zno
         J7K07F3h/HmURWhmmiY5ypniy6jsVOOmEuMXk6HAkinADyuwJNXKKLolbRg4EU2QUzW5
         Recg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576170; x=1788180970;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrOeCrMQEmHYylUm4A3w4i35ISZfmuGKPCvdC4iGLxM=;
        b=BTtMFfRR37kcehY19XjSD6M3J04WbjVo3rPl6Oxwk54m0Vb0DIdbnF5Z+MP46H3XFz
         3hbsoS9m9lRfRsdmBISASoUI0dQ7ckizKWNWB2yrZqVmUjrLE48yNX2cHE73J+FJcaTL
         0doylAz/0QMMVJKtHb6NS36B5c7Ay+KLTf5toXIkvfNmJRxx1KT7LIn6bgsMEv2SnnUX
         z4vCop38+l6zmDbdbwvK8uP/EMMuASlp6WC1o7nnbiPArUmotj/6N23vqPICDClWKrFm
         roenXL3UHixFEG5FbsvtcadXfLBotTPppFfUMuF2FT/Rwh/pt/9jtyBJ/EMUyVM5ZC1b
         FHmg==
X-Gm-Message-State: AFuF++ncE8RmhqGGjKE/FX2Sb4mCi6HCWo5Xu36IekjyWCokiTAv9o2W
	/TqM1aolnPJU1LQdH2e6hsodmVSudTUZCP0WL5iodx5YXhVnEegASjs7+abjt54oh4c=
X-Gm-Gg: AR+sD11P/p699xIq48nEJcTctgKARhrSlyxYCxs27tTaiGGkdiajjur1l9tXrWnkHt0
	J4W7SegwyMHQgf9pg5DhAvcEAUjUYJEXuRD97jOT9fDDzeDxBFu9tYghyWP4HUcV3NvjqUfXqZO
	n8epJWDtGOG8fHSaS9k8+wsVe2oNiNbcWIDpim/2OA6dCjYKVNQwCyzbxvBjW+dnMaQB3ELDsXA
	vAht+SBoGWbA+nCmAd4hfnA/6M1+iSKSKG6gBA3RHDlTDMG7+q/MTHoRFvvE9AoywgRTQbV+hpz
	v0Jx87blWW8TKQW3I/vKBCtW7GhjeEunhlRF2MOSCGwKFF0XNu2r/Et3lAg6K3BcZjwV6ICdHER
	qOqSSosot3PeO/BAYhet+n6gMUdRzlNlNp8qN60HYFWAlHMjsaeaRlhTPu2U1Otvb7ZPAFBDlCC
	oFN4rg3wyAp3SH5c5Of+TP9aEFYy8f6XRLtnnWla2dUEGbPQiNQ+hQbdylbBkDRsg50gWCX7IfP
	DPJUjIQKhaLXWE6lCOzuG3AaI5r8Cytftx1n2VpqpIcRFZsa/nzsw==
X-Received: by 2002:a17:903:2407:b0:2d1:1d3d:97b2 with SMTP id d9443c01a7336-2d64b1464dbmr523091015ad.11.1787576169643;
        Mon, 24 Aug 2026 05:56:09 -0700 (PDT)
Received: from [127.0.1.1] (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768d9004sm18007095ad.70.2026.08.24.05.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:56:09 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (yogafan) fix non-kernel-doc comment
Date: Mon, 24 Aug 2026 20:55:54 +0800
Message-ID: <178757615495.3469601.16079621663116422312@hanzhijian1991>
In-Reply-To: <21b29db0-06c0-4881-9750-d38b3bc931c3@roeck-us.net>
References: <20260821115720.2017516-1-hanzhijian1991@gmail.com>
 <20260823013841.2884472-1-hanzhijian1991@gmail.com>
 <21b29db0-06c0-4881-9750-d38b3bc931c3@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

My apologies, Guenter.  You are right, and I'm sorry for the noise.

I sent the "please drop" note by mistake, then over-corrected by
resending it as v2 with no code change.  That was the wrong way to
handle it.

Please drop the patch entirely.  Sorry for wasting your time.

hanzhijian
