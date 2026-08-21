Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8028C494830
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321076; cv=none; b=s2xZIZ9+0UefQzhuV35Fu7MugqZoqvZUTApetPmBV+JQfnlL9u5draNTv7tBBJpQr/0zyCQdnKgysop9i7JzXMMfzV8TNO+wmlGaIVqVLyFDPEJUu2CWnZ1UTjOtZHD/J15qI91rDymQmjBHyD8ODL6aja3bU9slzNSrBhADRXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321076; c=relaxed/simple;
	bh=JSPO1j+9O91I37tc5kdJ6UhezrcJTFl9DtI+uTZNkFY=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=khSUA9WU8vo3orSVbx7WIb0ItpnGvNBvt3XcHX+7VmRrxk8pn5ldWDgEl9wnbZ5qY5605ZWLsIsJadrFnI3hCxQNrOPy+Z/M1EEiWgUWffwYk3xrYGkUI0gSmE2YhMJHg3j3IEF0K4Gz/g+PI/tHbBSIgwZOGp/RATMsWrHlXVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0qSCJQg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0qSCJQg"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d5655cc850so12864565ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 07:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787321075; x=1787925875; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GbKtKc1WupRMC8dIJPpb45zPJBqpP60PWJmsXy4IMuM=;
        b=E0qSCJQg39yyyrKxiZs/u2COM/6Ya4f425WvXDl3luZMaTvUHRWrXWnTRpvQ+4uAfz
         jivjnFuJQMkZmSYo047JEaIou1VdrF2P3j7OCf4osQMrexj9ZUCi20xvUIka9XUapkA3
         Sp82cYTKOWVdSSEu2MAYk0VGaNxigZKKZb86LCcBW694Jr4x2Pain3oEOeKvlm2ys7Oz
         DMPoKp4nyVC3rztvzGCgSqI136c2w1GA6memaLr6t9G6D1hB7DrVJmVGrdpFfSaqEOXn
         twrymIK0Z+ohgBigKAdDXINyZTniONEHmoc1bepaDuRMyiBl/9GHKGPbfrY9hbmtxCrd
         guuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321075; x=1787925875;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GbKtKc1WupRMC8dIJPpb45zPJBqpP60PWJmsXy4IMuM=;
        b=qKA84KfcogRIZWijP8EAD1bIM255fgrbe5uaFoe2ro7bD7dFq2+a7VtH+xNIgQJTyN
         lNvhVcw7g/G3V1Kssq1uMVRmrp+QrWr0HWQf2WXGbeDyjKxdtMgKrNL0jL0lpv23Mgz9
         ZbpsWnCd4dYOjihkVGN0KzzzdRHY8bM3U4UXp86qejblCECg3NjTE3EAXGTTD0Rz2oi6
         qg9gtZ7pRY/pDa8RIgDZn+//THQSaXt4FzYuqEc7EGfO7bh2Eo8DAUBDMA6UCUkQV4Ww
         few5hFHzPh9BqzGYYUO6nSQUboJzuUaqmyVWiTy0RF1rZt7ib2t7nkpLD4XVF232z8UG
         zqzg==
X-Gm-Message-State: AFuF++lqrBp5Sg38vSnyDC+vXKL92bWfKoFiS1AIG2i2/1z3Nxkl1oxh
	tJmTLqP/sbFHfuJaajl/9DMB8b3ninQ1jssO52LYtuW/CiqD+vNd87cSU/fmtwv9JGA=
X-Gm-Gg: AR+sD12/W9NNWFDA18ehjmSt5oM24t9RHxoFQvaajobkY8vFKe3r4A7esYzP2IT6xKU
	J6QbOgG7pbmDWmyjFoq+eMPGJ35OiFFZi1kSNlPbIdW1opDjY9U4MVEIQ1G9ynPFaznkWUqx9J2
	29Wo2+AVXnO37dnzc+V6cb5S3XRG02OfnC2Cp3bdw9dbhSosXyLmS3H8FWufJpAYODvB7Jri2yI
	+H/xirG4wSRJd1ot3oywsZRULuxOGP1egPX9uX5IkRL8f5Gt+CZvLRgcCALm4Hc7m+FYV8hqOOf
	NJ8kGu1t2PleaiUHAO2Y4cc6Eax1ifHsCGbwX+7UE7jcFX3rymqtAoP1AFtVqUDQtG2x5eUKzhx
	uEwUJYK+Olizw69TSuh67l9As2/0xKSrGymef8EoeapNMhkG1EO/rm0nEQvB7rS9lgGhy4dzt5i
	pphCLXicS0/k5E16hByFh/eGr8jkvdJ9jLpGTcWP2FMfoFM2GjeQu/m/W9g3DlwjLYwTJ4hebvm
	8sxfykkkteQhJ7E8g62jYZMc4aRnmniO+jgrW7SZS+us0/weSA76Q==
X-Received: by 2002:a17:903:b07:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d64ada8eb8mr134649035ad.2.1787321073169;
        Fri, 21 Aug 2026 07:04:33 -0700 (PDT)
Received: from [127.0.1.1] (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e204sm19810625ad.51.2026.08.21.07.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:04:32 -0700 (PDT)
Message-ID: <6a885af0.c8f5739a.344789.f784@mx.google.com>
Date: Fri, 21 Aug 2026 07:04:32 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) fix non-kernel-doc comment
In-Reply-To: <20260821115720.2017516-1-hanzhijian1991@gmail.com>
References: <20260821115720.2017516-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Please drop this patch as well.  It is a trivial cleanup that only
silences the kernel-doc checker and does not fix a real problem.

hanzhijian
