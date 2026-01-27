Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545841A267
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 00:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769472886; cv=none; b=UUSE3F1C3DQHeu5gL3lPBvIgaKxSumGvBYDoCYu6gVQXMx+HpuUKhuRGk5aBnsLBtXJ9NsoQL3Noq0haNDwAhefytmj0P9UC1Qnnr2e9TwmFTJmbbJHUuYzdIUjgEg1qoIEukqKk74rt4l2SOJ+P3e6vPDYtNMEufihpBSBODQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769472886; c=relaxed/simple;
	bh=TH59QeXuQGouzsx54n3g7177F6nxdq5jEKo8uM4nifw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONacKmQx8//9qjheUS0mAkBQ0uEKP5nTaFWHjzWFwTTeoHV/UwGsRWm0/BrUZn57XlSJKv9tzTqWDg1NC2j+fAr9yJAkN3KmG1ToZ2JU2rlxzjGQER9wdovX29E/bUnM2RZx+VHtaRA4EBtBure/SGOr6OM2qoqPr4T6jiRebm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx/16uo1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx/16uo1"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29f2676bb21so51362935ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 16:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769472884; x=1770077684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bI0cUR40vMu/6PE2qVNNlqy6g+zm/m1EfFecSGRNTY=;
        b=cx/16uo1nOf2B69/VAEkLJnrS8fdFaRgCFt7pRO8hLJTMYv+/PsceIqD0Aicyq76Ph
         8U7IYwlB1Gveh4Z9ZdCZJjPGlVpAM4DWrbNpiS1/ZkbnnwgFvL/dsVGeVmcA5drT69er
         pOt/saXGcXnxpvVe16goy/tV4xAUMyhelZ1x9PZKkszOxgGuaNi/A0IbjFgGikYrLhzM
         AADzEHDMShTPqwlBHE+XrZLP8MkA9WEmxa3K85DQHsjbLfxa6wyWsP9fP/+h1P4KfFbQ
         AMUVMo/MgpV066oYKBYE2AdYmEJ1louhkyjwte0JnpJ36PBV9LI9jiJ0sauRw0kTsfVJ
         V2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769472884; x=1770077684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5bI0cUR40vMu/6PE2qVNNlqy6g+zm/m1EfFecSGRNTY=;
        b=VybPaURa3D88PSC/3gA9wFW8P+6d1FMbl4gCV/01defzN4rsO0PSvGcpcmeFUqlk+h
         PDZT9okzd79tCkGZAL1CIUhdM0IT/8rZrN3c0t9bE0ACRUOycMXZsmC250H6upjUD8ff
         sol2fo76/sKF+Fvj1UlPuauzVVtg+ijZOw7ocD5RvNQ9EMTK61xpYaIa3tkZEQWK+r34
         wIQbiV6z3VO9Jo7MEIvkKYuOPpA35dNCfUSqvUvC8X3v2InTrM0mfHbpn2n0UpTPB/Vs
         Hm04NaWegGsFbHGZ/jkqMcVOg7sltJPyKYlySyLGf16ccY9QbWIru6clRlT/SGNU438u
         a1Bw==
X-Forwarded-Encrypted: i=1; AJvYcCV9Dgh3Skn1unUe5890epdzryao3yq39hPyO+2iUYw5t5tfm934+0pduPKKN0SMlQX4aZErzGNlmT00KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwESFH7oP60KSpG6hg+bgggveITSMcLpZgW2sdoox5dPnk5bl3u
	HAp7/h6qzRIApX7n24AYzJ1cV5f47AawbzXbgQa2yUkC0zbZrnQ0/MaU
X-Gm-Gg: AZuq6aJZmDRuUYbvvl/GT2kI6h4fNCU4eDf+PnC4w4OwY0SCY1vm8QNClF1Nsw2YfWq
	5Qm9KXVKLGJh8WgLB5iiv6VESo8k+8PHomIwI/Dts03PbarOpYWL24cRF429z1cLioIW4gIAcMU
	M7ohU95pmjXAFCEDnhjs+/cD2Gv/R6vlVs9GEWmFlKVUwbg7rYqJzBT/GdD2aH6yEe4acNnzu00
	5Lx5bMxuQfKT1Uri1v2vTtgUqQlYX88prFUvIYCcZ/n6Zi58bX86IDjP46kTcSK99u3wO7YSm2h
	M43M42RgH7c8F5aDXoYBmqHfdkg6Tgu/dppShtBFeyY1OBnB/dTzTJvgJr2BdndF6g3M72x5Der
	sIJKMfgCUJ/AXixRK3jaSPkjuK+AvuwAyT2oIJZtZ7nBfvHgyem5IZk8IJMYLW0SpdKobijDrAD
	2Smcwpo7HsWLB6WNK+CuwGsgvEUrVU031QIXU=
X-Received: by 2002:a17:903:244e:b0:2a0:e5cd:80a1 with SMTP id d9443c01a7336-2a845323729mr67639465ad.41.1769472884595;
        Mon, 26 Jan 2026 16:14:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fae223sm98674545ad.77.2026.01.26.16.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:14:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:14:43 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mayank Mahajan <mayankmahajan.x@nxp.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, priyanka.jain@nxp.com,
	vikash.bansal@nxp.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon: ti,tmp108: Add P3T1035,P3T2030
Message-ID: <2d56908f-1849-481b-a567-ae7b3d925ff6@roeck-us.net>
References: <20260119040459.2898998-1-mayankmahajan.x@nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119040459.2898998-1-mayankmahajan.x@nxp.com>

On Mon, Jan 19, 2026 at 09:34:57AM +0530, Mayank Mahajan wrote:
> Document the NXP P3T1035 and P3T2030 compatibles in TMP108.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>

Applied.

Thanks,
Guenter
