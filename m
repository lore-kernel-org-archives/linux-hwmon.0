Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7962E0B5C
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 07:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803203; cv=pass; b=M7u6UkFkOc0KR1nQq2wSvMlD17IhJu6zn1WNmXvoR/6//XSyoQEznmfE6+dzjZWPdmSmWGb8mwxAmywiKmL/QTJKL3LrUlkZWnKLODPFaNJUVX2EuqlNAXvK9mvecZFlyBao3RAODrKuJ7TDKfwvol/Gp3M+9pp+KVluhT3ckAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803203; c=relaxed/simple;
	bh=TTPpw2tPJabjQqsI1rZCNpItrW0CyPmWJA9VsvH6Ca4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lLpYrHA7Qu+Qgf4aWumgbR1Gvvj83Iu+MpCEZK5tJkesmRcDebLEKtm+aVrIZZRBLGUq0T1F1cvtWESvENhFO0dA2+3GzqRJpXTwpuzLvLXvAA6qsgYdQiRrPQP6DAqVtL/AnNi+S18Wq1QMAVErIEG9SWK4D5znboX0bSMdR5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeLLUih2; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeLLUih2"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37fdee9276fso1909496a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 00:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782803201; cv=none;
        d=google.com; s=arc-20260327;
        b=r2JWw3kB8m+HWSi3np7/Mwcmc3t6fdYpWb0AxUCIcZxiONSuLuNY+r1+RTjsA/SCP3
         1I/eVfhs08SrRKKnECy7PNcRPNCzsyELJzoJatlxL5aLNDrGU7XzX5omaIhHQmT8mo8I
         mRw79XDKCuxxA9BdMxQsymneByswiA6tpHi7mfR/siVZkxscMMWqA3Zxr73ppDLadDAD
         STiCKvo8OjxN6/fr3FSiKZYR40EVz44hPvRbdk6u0D5AzWvG/4xL5WqARztuK3v7DCl4
         7l3aEu9/fn8XV5zaAgU+BClms89ccbmVsYymrpvas1VsfaeQxd9RLqjmD1gIutoPKjoe
         SIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=a1zXOtS1lGcB46+233WMS8HtWNMltCjgRC5QtegikN0=;
        fh=sIIBhuHBUSV+ow0S+LCHbeAAEP4AA307c0bFhd8yw+E=;
        b=eLjzEc5jAyHmEI4OIJxCxVz7vuHQCcrJLIVzhfFja7hzfE3vuGmcZ5n2IFQFuOZgXW
         STTojFpCgNi4OS6BDr9ypXIRLwYIyrvIIIaMqW/glovfSGL3EEOXWLN+gBYkHRY/5pwV
         r3THuUjHFsWaPo7pftyhZxHS74DdkyU5Z5NBPx3f4VfRKqgcDbzOe7zab7UmGcj2pK8x
         3JVznhDPGv6dbFV2Fsejw341zozxBHIm0fDJO37ASnldf3bZ00m2sOntKXyKjvJoFUB+
         Qxh6z+IoGLG/hrUorXgwwmRT8Q+x2fRDN2QMhluTA3joEfPCdEdpN/WDgrVuZsXsDDsX
         ZSJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782803201; x=1783408001; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a1zXOtS1lGcB46+233WMS8HtWNMltCjgRC5QtegikN0=;
        b=PeLLUih2aXaiT7DbdC8sHYNVvCxPB1VT1eeBHiHoDXaDIVRTVTxFHJvp0+fYHVoQmh
         3yS/UeEJiLaSI89+4TX1aeF7xs3Fh1YwspXR0kbC8q4RIe8SgI2HKT3jrYdf+b4bTYZg
         iuBxO269BeO26UkNwjcvCvzLJlGryJMfPuaqSZES2RzepSfUHqxDcyOy1ZEIU8HByyS9
         Iwsax4XJ/e4FDk1DZsx/3Z/zULBbk5UHsDc19S5kuQZA4HYDzH1aYso3B4l/hM8wbeoZ
         y4QjNvQvG8PSonX41Eib7dvr/2hKjg6jdKcNinLNxP+LERQJ2LgSWCAba+znrApzWddZ
         FIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803201; x=1783408001;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1zXOtS1lGcB46+233WMS8HtWNMltCjgRC5QtegikN0=;
        b=FAVy6cT8WAP/LhvVE1oqSHhyviWv3oUSlUSZuVZVGErULrFlMpI6dDnT7J52R03SHZ
         GPiyG0vMP8QzAy9Kqa9B8toAhrS0R3uRSe5LhqQsfcvnUX5dewOGFShifXdaqvEJnFt0
         1i4wUFe4VL/CNomh1mfv1i3i0a85rAlkrcXHZHJjNr2ekkU8x5bu8hJL9c0+rUFa6HO7
         O8jY0Ex+2S42VK6qlSUn9E04IygvMBXm6nPNgy13tYQTumMARlzYG1xxrfEy43UNgwik
         IyvSMqsFx+4fcJFtLGaAcHvptKsBQXALbp/E0Tu6VRjRnNc8uh3qVkSpvnsX7AFQCAdC
         Avhw==
X-Forwarded-Encrypted: i=1; AHgh+RqP4149q+pBQP4W2M8VD/hSCzJYAZwS2ZrqnHPbYcHzzHU+sZTyNkQVB+CaP8phD4tNBKLmp+BiK+oe2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy20jFYQtViyJj8bKfcyJeoGaVBgHHNlYpQe9yAe7Nnxc2V+1Gh
	/BvL0GidQNAQf3XuX1sZuK+GgsfcSnA2jAxMvmDdi/ac1iD7EhgFLeE+ptWBJRZrexoOKeywEn3
	o5JAHivK96gApwe8Qe8sAqqJ/qSLMoezq3R12OrM=
X-Gm-Gg: AfdE7clQ8KUVMRUfh3AZIf4nVFbxIO/xo1nmWlDsbD/1Mb7u9trsrgBrWjS9q+dT7dv
	i8GdOEl5mRbTge02LQzUuJ2cGmPyB157s1/p2FNVMivWfHf2oiVfCQ1As08bRE+mRMHIwixxaGK
	34O//5TqDLFGBFyPax2Wrz1o61RL55p2p73PG65MPAWbE8OjYXiJNOLpqgYjR8MPhXs77i8lgcR
	OOKAxKt7q/NNjwAxh7iQLuZXzEIJKwYMd6vPwaDgzR8MBkcF+gg0YzKPFvXShG+sKPFTZzsLCj3
	YoV66T8=
X-Received: by 2002:a17:90b:48c8:b0:37f:d1e4:2a32 with SMTP id
 98e67ed59e1d1-380526a7796mr1784997a91.14.1782803201463; Tue, 30 Jun 2026
 00:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Delaida_Muminovi=C4=87?= <delaidamuminovic2@gmail.com>
Date: Tue, 30 Jun 2026 09:06:30 +0200
X-Gm-Features: AVVi8CfE5GC10eqoaJWhNm3LwgFRrXmqlKPCzQZn3rN7X0qgYr-zOF3uk_3PGgo
Message-ID: <CALQvZG-F9_69jWX4wvvWLxrMxWqVFM_dcR10noNMEUzp8QBg4g@mail.gmail.com>
Subject: Re: [PATCH 0/2] i2c: i801: Detect SPD Write Disable and expose as
 adapter quirk
To: tinsaetadesse2015@gmail.com, wsa+renesas@sang-engineering.com, 
	jdelvare@suse.com, andi.shyti@kernel.org, linux@roeck-us.net
Cc: linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tested the series on a machine that hits this bug:

  Lenovo ThinkPad T14 Gen 6 (21QCS1NV00)
  Fedora 44, kernel 7.0.13-200.fc44.x86_64
  BIOS N4JET27W 1.17

This controller has SPD Write Disable set:

  i801_smbus 0000:00:1f.4: SPD Write Disable is set

Without the series, spd5118 binds at 15-0050 and resume fails with:

  spd5118 15-0050: Failed to write b = 0: -6
  spd5118 15-0050: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6
  spd5118 15-0050: PM: failed to resume async: error -6

I rebuilt i2c-i801 and spd5118 with this series on the above kernel. i801 now
marks the adapter with I2C_AQ_SPD_WRITE_DISABLED, and spd5118 declines to bind:

  spd5118 15-0050: SPD Write Disable is set on adapter; refusing probe

spd5118 is loaded but not bound to the SPD device, so spd5118_resume() is never
registered and the -6 failure can no longer occur. The approach works on this
hardware and is cleaner than blacklisting the module.

Tested-by: Delaida Muminovic <delaidamuminovic2@gmail.com>
