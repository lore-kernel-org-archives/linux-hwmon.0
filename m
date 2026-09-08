Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8CE583AAE
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885209; cv=none; b=g3u7el0BH1Ydfi9H0MAJCPut1F7RvFXQMpBFaIUyNXIWYfJ4YhQiG3gV9MxhUpqV0+fOsz9n8eMKeoEHZJ6EpoKAj2+Cbn3BDeEbxhnG/Bf7lJa+uOWnvP7Hbv476/o9syFuXJIk92pPU3MZN978sgavppnz0vjpMpJqL30DzFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885209; c=relaxed/simple;
	bh=yBAnOHQn7rPSTJL9LuORbc7lDrVtXUzjk+vsXw73QIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Io34uu0jAdb5E3fJOqYWZ9PnzZw6xLN+mnGswyUo+VaBuYLrR6EdHpGTQAF5qyB3frbrrcioVkqlKhrhkEpKQmxuTQWjMW6CwbVzaeZL8zkx7d/bwllxwkDVkT7UpMq8wj3H6pHDqQ4+ndgkeS3jvXbexIr2OidJRCFaDnkCPGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8I1n1lU; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8I1n1lU"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so4598644a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885207; x=1789490007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HCMxOpzkPWvwtPGSWgpMXMCScuJYEjTiRbXV88KqE5g=;
        b=s8I1n1lUG4fAKUec3yJLTF+Y/Ewm+9uAmbbp/6V4d7SLYTD9kn6w+PgXdwG7ri6UQ6
         2bS/yO/jijYbtCIxz+jsXz7hvbNwySGoinDPgnIMqSan4a2+7L+uJxq0pt7fUN354gSw
         Y5Ukie10vtJA5LS0cOl0qscYyHa3f+bMLDx9yHDz8sBk6GpLB9G4d7PcJUSpwn2d24xS
         aD8x5wPZrxd2RqKymFByZiN5kyyfb/ykeaLqsYDv98qcnEv0HraWm1qKm2ojfRgLUEfd
         ZoGZI2LRmrudCu5Xo4vPQh2yrGuH+O94KuSp1uJ6wmH7DT533PVW1J+39aCyrU2cOIRk
         JMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885207; x=1789490007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCMxOpzkPWvwtPGSWgpMXMCScuJYEjTiRbXV88KqE5g=;
        b=IACmFJn+BBjy9b+DMZoxpvH2Y8iyjFFyYnyMfirCo8cYrtRs8rkAC3itrjjaptqA2o
         JxOxcqY1EVWhWEefQfqbIGbo8T4ys3YcgjziO6AmKWiw0qIJrYCcfAakBPfuAgAFwl++
         YdcYbQCtiBREA+d1rW8qGI6lkfLFCgqR/QebkjdkV9u4um3pQJPZggnle7kNh7QFt/f1
         GVtfucfK9T1RxSzdLIED+KDgKCTzcuxiSYGW0HgOS6sDzb4ZxJhkWLQ4TdHrmtHM59NR
         07LDY5I3uCFsjPEfWIkKP/kBFemAParfKr4W++wxM+i5OF76RPblur4u/zF08cIk1Wpp
         AJ/Q==
X-Gm-Message-State: AFuF++kD2M4qTpRJUEI8RyUOd24biO1rdan/SKhpzqHbiM4JVS9eW+dq
	H4iueSQv2pPq6TCQqTJFLWW6Hab9GGM4PjYM8/2oEQiRhAu5Xgw2OZ0GY7y0tA==
X-Gm-Gg: AYBFou1SE0oRiojBFP+GQ4c+0VTY4FTkmiJThzuPTEM7kJKwnDIXT6mCjpxPDER1wAJ
	H4nJ+zzjONiQAT36Luu0CTUMq8/pbTJkMuKrLxOHRmBWlTrKGKOOhiLK7wJwcIuJduPrsStcJat
	5JXdy+IU1Un6BenpncfDoop1goOTWSMNVTECFHps8dzGXVCn/n+P3og5Kq+orgWaKHe46L62/ct
	KIUtlJ3KGof9tAWN4/Vwqv3h5Rl4SrJAmjSky6ofso31i11D1YMaPMVnJYgFc+dFWDKMfi5mami
	4JDV/mqcI4zfvO4+p+LGLMO3aJ0pGjjcQ1F5kM2ROC86NPDl91BPUCpfpzS6mIlvyUlzjZMkT8o
	/39Vi/wQAQuZCGrrU+mSaL7MEJcUH4+bbnSLdm1jOQo8gvhX9me/pEIFNFTvwPeXl5jmYbbKS6Q
	M0Znu8HiZGsn8hALvRoGlSQnB5xZA9P+zViqRIXBl1xDHg9m8mGKSkOhZza/6SFQzIFwY8nGF7l
	A==
X-Received: by 2002:a17:90b:4984:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-39b26104798mr41111091a91.6.1788885206711;
        Tue, 08 Sep 2026 09:33:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26127fddsm26725619a91.12.2026.09.08.09.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:33:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:33:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (yogafan) Add support for new Lenovo models
Message-ID: <a5548d73-a923-4cc5-8c9f-d7204028bd64@roeck-us.net>
References: <20260908094931.2227049-1-sergiomelas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908094931.2227049-1-sergiomelas@gmail.com>

On Tue, Sep 08, 2026 at 11:49:31AM +0200, Sergio Melas wrote:
> Add DMI quirk entries and map correct ACPI paths and configurations for
> additional Lenovo laptop models: Yoga 14cACN 2021, IdeaPad 3 15ALC6 Ub
> and Yoga 740-15IML, leveraging DMI product family matching.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>

Applied.

Thanks,
Guenter
