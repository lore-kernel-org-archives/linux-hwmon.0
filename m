Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6D718FDDE
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 01:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088559; cv=none; b=SGthd/VdlVEEBREusNinVPsHLr825Xr/XLLPbcypkH/wDYml2VMVuedwqqsAPfN0Ns7++bKunrJzoRitNUoVucy2jPRoH5kv+X31Edq0bv4cA3SsxPhXR6PxAlagZt4aZtX9JMdhPogga/oAnqXHVILew1OJ5PsP9RiKI7cImVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088559; c=relaxed/simple;
	bh=TiFzUS2aHYLoApSqvwEeB9zLb2sSir/BfO8lZ3oW3tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k42hSZ3qc4ejVECydu4zDGJLe6VQt/tdDBGKj6XmpirmwSGtDMX2WlKBUAeopBRQq5K+YTq9ynixiWdsmVmP7N0eJPNXc9kODfIuG913KKuKXR7DcxRYV3kzbn3wEu98gvVwXpFFt4luLU3gU9wPYGvO1AbXazTTqSc7KhldoKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKW7dDZT; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKW7dDZT"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67124ad7615so316815d50.0
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 18:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088557; x=1789693357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gU2WF9XqL472gayp+lMBaEHlfREfA6uslBJW7Hl4Whs=;
        b=QKW7dDZTUEnoo+36DM4WzjJ5RLrqB2Fia6IP9KMuwEerQ2zrjzy0l3gpL6/gfeh5II
         2L0+Q1zu0FKuwKOqp7Awbd7JsvICfR4oLW3v3zQao25YddawqV4rRAqTSVx1zFBxd4ui
         RgLrsfuenJn91A11Cw3WRCJVB6uaUlknqkgNAihbnsFaHdqW9V7eBJuu9MDJC65Ork6O
         9MWv+/RQj4MWy8L4MSB3pbTro4X+4Cmsopu2RxKbnP4S9GAV+bonAbanO5sVcxAU1YZn
         x9Gyyc+K3jRNvTAWdDL7d+nzycYX5sxIQY3nme0W2OuMgjPhgM2jnAgjPTv7mYt38XCh
         priw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088557; x=1789693357;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gU2WF9XqL472gayp+lMBaEHlfREfA6uslBJW7Hl4Whs=;
        b=Pwmenf83I6Vpb3x4P5o7qhkOQfTleboKGfjuPGA/wman6ByUfrQ1RNjWeB8LEcQryP
         3qDmIJUA/0ZPiTDXgK2sRaGUscwNVol0Z1faihgg6K98Us8Jq50so+/GLECjvDTBLHJO
         nLtNkn8d3iu5Qty7wB3pIESlonQ24+bZRGk941itrZ734t2Nt7YB7NY6WTU+PLq1vkCx
         4NQt9OAm8FFh9Yu2aHH9D4N6ua57YU3wZXJHjzA1PiZzM5Eoh8BNB+hjNKF0qjZuLzk3
         lKinecFlsECdk69b4N7zlBRY7IYLkVEy7qCTcG5MqZ32YiQEnlClUcJlrUnbLcytK0La
         L5tg==
X-Forwarded-Encrypted: i=1; AKwUvByQp/J/KznrDQDDMIdS+BjFOjS9k5n7HHAhMHrZju682A2XEFWexqnEQwWShEaFVM0Gy+6GC17bBn2FHQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kiovJDpAlv+q2jnuk08RPKHPxZJFDS0frxclzU8Ryj87WJ03Xx
	iaWqtzQ8H8fG27rUv/oevQh2a6rDC1k/moQG5F0OXEwPCZXTrIJN262/
X-Gm-Gg: AYBFou2qflhggXRO5gGYcuMPx3QDeYQgd/dq7gyrHZ00bA8BnX0EOwjE3jtwno1zULF
	2qohL+GCtV7aTrT5OBxvLnZZy9QhF0Did/t7f3nli9PEYnvowVKE9qks3/zhfb9ZuoA5hr/OTUC
	y4lF7LoOZ5TeR+ilO2XweS9v+kc4ZH6YGukrzmhaX3qOBrTObca0VmnSU5LDHrD83wlKh5Nxv0s
	ERiA8dyNE6mnl2O0Ntk5FpzonkHAoVDFCT3E3Ybpz8Q+RNAgIiy06ficdd/po9HBjSGgG6G667W
	Z1sgbXji/GMJjxzfWe/yTuMC/c2STDHPzNlU5aACFaNy7ps7Ksm5WwtljH8xBWWR+pqPJQFt0rn
	nhPknhGCYoympusPdfTmDHRpK36XJHj5E8QOtUh40XGe5Fl2RdPHhMKkHF8tVKvtNL2bCanvuVp
	R3DgGIOgOtMO/WAzE0I13wZ5tk+U2056CTDYonZYWwiixFJSK4JLNi3yPL8yDwNA0AAngeakKeE
	37QY7UFUtnt
X-Received: by 2002:a05:690e:b46:b0:66f:a1e3:9c77 with SMTP id 956f58d0204a3-671245584afmr961357d50.2.1789088556949;
        Thu, 10 Sep 2026 18:02:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm1826445eec.16.2026.09.10.18.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 18:02:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 18:02:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (nct6775) Add support for NCT6122D
Message-ID: <0c683a7a-a824-4b68-83d4-3c640d90f876@roeck-us.net>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
 <20260909-bootlin-hwmon-nct6126-v1-3-4e85615fef10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-3-4e85615fef10@bootlin.com>

On Wed, Sep 09, 2026 at 08:25:56PM +0200, Paul Louvel wrote:
> The NCT6122D hardware monitor is the same as the NCT6126D, the only
> difference if the number of UARTs: two instead of six.
> Add it to the driver using the nct6126 chip kind to avoid code
> duplication.
> 
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Applied.

Thanks,
Guenter
