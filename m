Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DAA36405A
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 17:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779299363; cv=none; b=CFOUmM7Owj3+FVRPievKvpshoKKIgN2+EbCHjcabJWsYUP5Zl9iNjORhH7QFcuX/F6bAQ1WMleeguSV8ugG7hCCGyuoYVLc+wuv6aBYc5pd8QRN4yBpWCqLYWt3hSNP2UPH73oKVrlL8IbETIPR9Y4UpxfmQg7fnqL5N99jcGu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779299363; c=relaxed/simple;
	bh=DpvmlzvY6/2l4J6yYlA8b6johltNQYMgxfF9s7rxyCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrcxjq95/Yxs4kKhSDfAw1CpjUF8eLcqeKCijLE3hYO7ATWH1GJRRIlFHHCdupAot+SXBlLxcKXb1ICKKGotyBnwRAb3vCXX48IebqmiXY4o9xOG7LA59H0WWcR6SVOMi90IkvY6OKp7TqGBrxdA2ayx0xvvNc7N8AjtaFfibyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezG3XlIv; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezG3XlIv"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b941cd869cso32954555ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 10:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779299362; x=1779904162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUocfPeZqMUh8C1wxj8BZw9l2bs4+997e5jXLGYDljU=;
        b=ezG3XlIvKFXoX4Yf7fK4iMq3HTfvjozVxcVy5JvCpCwnHGa7e7VUYaHqWc8CsjWS46
         7fgORnxKZYPIH4fBRfxTF0gmBxkICJebwFiACRzoUo0YPYeMmfr4tf+2qfuWGt1wY5X8
         nFLBAWr/8A3dOvhGmAcgs6Qs7oC3JyU/0QCKCt0nJW/mdLYByU6zdQkFd4uG0lkv6e0Y
         3C9vtsrz8gqCvOmTYOWo6Ulu7lJiXp6KvHQyA0HHR85+SxWE/JhSj5MPpQrN7nJErY1f
         a5TiBfbmeiY4kK2S7mfTc2eNXdNwjYiapa5Ow8aK1DqnwRCgvxbNUKU3gRGscndZd4Lj
         Xf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779299362; x=1779904162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sUocfPeZqMUh8C1wxj8BZw9l2bs4+997e5jXLGYDljU=;
        b=qDoawgr7CCCees5D8FU4pSY3Y9WAj9qMiNuA9IErgAzonXihmcrEzoUd9QfG2TDafk
         ajxmYorcv180GFg7/CO3MYFdHWTmzwlV46IfsjPN/i/K9ewbiAZGthtJVGrydYZhbMb1
         6IekX2k6MVBo9vMZ3u7m8Se2LkmahO0V86jvB8V0TO2KfFho1iJiabp52EVQDv1+wYkQ
         0g/D/LZSqR9dvbH4W3IpnCrHKUWiSFezb9jEMeTquv0rmS/N0mrZxosd8sgrSnNuYRHr
         Rom+DkSOSyQnX+pdrJNlTJwxTp/HqkrR9gMMJTo2WU0IlPjL+JSYdVm8HvEgUXz3T9lW
         /UwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qtMGu6i7iPFqnLHEDOHoZpuzFEK0biCeOujFsqxqEGuwdDcNL/O2AcnE+FbEUJkRvbBDfRjGVdSXZww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIyZLq9Rzl758mtbbjv5dBW3TjRINNEbPHZmEd3bdVAhTT92t1
	L9unPZt1pDLclBJpxEUFuAXRjSpZFnuwGni/4RFoSnqJMFITOaBNRyDIhTgxyr++
X-Gm-Gg: Acq92OFlH663pqidGVKG0LPVi2ysu8Y0Hp/BLPi7VWK/0EmXk/aj/IWU4Kk3FgLp/2P
	vFn02cBJxkaOm+A1H035Y2+nEOFDqEBo9/RNt9R+zPCuRTHu1GiL8La7+vgjUb0w8JcKmvYjSbm
	IWNnkyiGwr8VCCexgcPgyWYtzE7cjFbja1O82HD/bMSNOenK0Wj7ph9nA3eiYcZZ6XckDgCZXn4
	h5hOel4T2QFBlIPFkiKuw/dqYWALRCwuc4KCiVqRpLfkgxuZWE9SsJkVyPeMmjltIMZ1npQyDkC
	wzJHvFjY+Tmm9Qh4bALYAapqHM9Nj6v2YQUYh2Ae7aRvGlmDBHJLB5ozCBqCm+mN15QTEel6Dpy
	cKhM1SqJlw7zofAyeyzrHQZzYPI1q2cH6SR2uWslGhNhK4/BPtdDF0YTKhhl7/LCx7698bF6Aj0
	1r7NXCWZC5RZkV66ixqEIVPS+tftGh4EH8JfuN
X-Received: by 2002:a17:903:1ae7:b0:2b2:49a7:a5bc with SMTP id d9443c01a7336-2bd7e9e5458mr256888955ad.39.1779299361763;
        Wed, 20 May 2026 10:49:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d235e04sm233974235ad.80.2026.05.20.10.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 10:49:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 May 2026 10:49:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Alexandru Tachici <alexandru.tachici@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/adm1266) serialize firmware_revision
 debugfs read with pmbus_lock
Message-ID: <22158259-31fd-4f0c-906e-46d93ad44f9a@roeck-us.net>
References: <20260520-adm1266-fwrev-fix-v1-1-8a78c94a53ef@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-adm1266-fwrev-fix-v1-1-8a78c94a53ef@nexthop.ai>

On Wed, May 20, 2026 at 10:38:28AM -0700, Abdurrahman Hussain wrote:
> adm1266_firmware_revision_read() backs the firmware_revision debugfs
> entry and issues an i2c_smbus_read_block_data(client,
> ADM1266_IC_DEVICE_REV, buf) without taking pmbus_lock.  pmbus_core
> holds pmbus_lock around its own multi-transaction sequences
> (notably the "set PAGE, then read paged register" pattern used by
> hwmon attributes), so an unlocked debugfs reader can land between
> a PAGE write and the subsequent paged read in another thread.
> IC_DEVICE_REV itself is not paged, so it cannot corrupt PAGE in
> flight, but the same defensive serialisation applied to the other
> adm1266 direct-device accessors applies here: any direct device
> access from outside pmbus_core should be ordered with respect to
> pmbus_core's own.
> 
> Take pmbus_lock at the top of adm1266_firmware_revision_read()
> via the scope-based guard(), matching the pattern just applied to
> adm1266_state_read() and the GPIO/NVMEM accessors.
> 
> Fixes: 7c99762af5c1 ("hwmon: (pmbus/adm1266) add firmware_revision debugfs entry")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Assisted-by: Claude-Code:claude-opus-4-7
> ---
> The previous "GPIO, NVMEM, and debugfs accessor fixes" series [1]
> locked all the adm1266 direct-device accessors except this one,
> which slipped through because firmware_revision was already in
> hwmon-next when the fixes were written.  Same defensive-locking
> reason as adm1266_state_read() got there; same Fixes: shape
> (stable backport candidate against the original firmware_revision
> patch).

I completely forgot about this one. Thanks for remembering.
I squashed this patch into the firmware_revision patch.

Thanks!

Guenter
