Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F1C2F60CC
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Sep 2026 11:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817786; cv=none; b=OQyusFdaqRb+vPsnx/xp/s2qCw70OOGtvuanGmIGk257V7AhXNbO8IANF7nbdX9MNZ5QmsYLk1ymuVn2t2nkKA4uqRamdnAjv+Yc0ZvyJAwiCKw56iU3XtOrytAJ4rpDkZ7q5HHO2jFkGZ3hU6LbyTNNLHVOa59Vz8/ToVijbds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817786; c=relaxed/simple;
	bh=kTqY5qpGtIvvRtxQ8u/RwVAIS2ddmQFY14gCuYLRjts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjWLgcQaqT7zNjxWi83PLWzIVrY/dx8ZvCPFBxWEahx6VLc4YC3+iireqQEcUoppmrTyt00aU1HX6S+0vEzwz8km8vWUWNb4p+wmDyCIEUKU0fGvhu88u3NsnX2lBNhWPclXaV+mFyYc91vS+JWdN8OW+VhE34bkYAQyn95Qf4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1l/0OE8; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1l/0OE8"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1346676a91.0
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Sep 2026 04:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817784; x=1790422584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LOwTThtG1uC730wD4kNwwPDkUEg5WgY1ESba7svXy3A=;
        b=h1l/0OE89T5QSpqSUrK8D8cD7BmZJ3g+b5j/xSfioKtWOBSdN4sV+iG8jsT6NFAT7v
         3O74B+oRIvJykfxya8/cllh6mYhvZIPc4UB0NH8F2oLVoTkyjMDpBI17wh8MAD+OAzwk
         AURPUCxTJWnwtURY058H/niIvNgo4UWBSvo5lxZFu6ljEOqPb5Ota+FYyj3ZeJOth8zW
         AlJKMoQCoLswrOAgDWDBNHDnOUeP+B2aqAbVKAQ3RDEKYnRkRNWECuYNbezZrw9wJ6h1
         /+fzdGWIeIDuzLhLLks0dLuHnZHb9THkYKA8FyBf7LXuDz4R8G92BuJKDjbZJoRP4+C6
         SpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817784; x=1790422584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOwTThtG1uC730wD4kNwwPDkUEg5WgY1ESba7svXy3A=;
        b=jWk+HEtyaIyz5qp+k2cn15GocufOvGumyiGiQwhF5n9zhKE2gIcVKAuMVLnKyZkMgd
         fOvHWwfObNx8DfsVsh5EXvxZQqJwGNhv0O6+jT06lPXK7eiz05Yg2S4DHW7n50uOdx9I
         1ndY8oCVmBz+FUrRcdlRCK+mtIu5nNuYhB1ObjEmMDv5FZ3pvcdxaKptrsTJrtw4H+iF
         /bJrWvmIxgSFyljvh8PGNItyFH/6GKw6rDZgBNDFbgNWTv9617fv+ewFxMK+9z91WkYT
         dO3WkR75GUSTLhUsdniGSLVKbpJlKVc30urousDQpBIDnu1w96XQ5Nzu4PGJ8eA3qpJc
         mOFA==
X-Forwarded-Encrypted: i=1; AKwUvBxXMbi4tagjTj8lzZubv3ts/TbKjH0LYXRUI7YRsh9uKiWsRCgyssrvK6LstEizcvUgUDCzTtJMUPIKqQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lYNysysu/2Ik7yr0Sdq3YxzkaMDs8CkjWoCvvHe9Qn4MBYbH9u
	zxirfJREaJJ91/qFXYAbWABEi+09d9LUIkyRvLpdHAr9Hc6oSCpOizUR
X-Gm-Gg: AYBFou2rNWJAkb6Q8oJZ21kvOEC8JB2kVemy99pVOgwyhP/8pCGudO4V4MrzjOjGeRc
	xXd1ZiMfw7WnM6yZQ7bFm0ct3auzztFE1CNVhUWe3BCpmnogqHy9KpRlb9sw7QfezMp9oPP/Rxl
	dfD9LdHrlu1nTMZp7JqJ0VPaVTlVZIgQorwcGdesKvZzLcPVIm+RtE5nZbIMZbfwGpbnh0Im71j
	S1zA1d2VRQTkY7F51A48FLpusrCgA/MAp8H5/vs5RDW4WtfqlhN2YewxE6uLgCzn2lQRym96QFp
	zMCGSleuxVQd5YB33MK5fJLb2sxLDbykYAPGD5fTcgft+LD87zE3tSCnD7sOI5uxZKq7GOnQvba
	VLv4tE4iKyl9n/lb5SnLSU5vTIxKzb8mNwaWF99eJWVIrkXDZNyUV8TpE3OIv01MGoeu5cMBoX7
	s6eq7EDILU48pnXSuU53YKN9MFBSkK7LiRF6rAZ7WN9xmRsQM0rnp9+5R0rQ1b+prKntDI1vZUv
	sAeBuSEk5Ce
X-Received: by 2002:a17:90b:2686:b0:39e:6c69:7772 with SMTP id 98e67ed59e1d1-39e6c69791bmr5107806a91.27.1789817783850;
        Sat, 19 Sep 2026 04:36:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d96esm5532111eec.12.2026.09.19.04.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:36:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 19 Sep 2026 04:36:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	colin.huang2@amd.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Message-ID: <a31a41b7-10e6-443c-8386-71d6a4cc953a@roeck-us.net>
References: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
 <20260918-add-tda38740-and-tda38725-v6-2-a8b11018d850@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-add-tda38740-and-tda38725-v6-2-a8b11018d850@gmail.com>

On Fri, Sep 18, 2026 at 06:23:55PM +0800, Colin Huang wrote:
> Add a PMBus driver for Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Applied.

Thanks,
Guenter
