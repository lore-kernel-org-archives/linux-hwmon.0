Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE3E6F086
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 17:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714325458; cv=none; b=tNRBMiSG4fJQpg3eC2xh+CJNqhHQyh/1fB4eoS24IEL0N5MjvKPW3cVkMgmtQ+fXubpK08KkFD8sbwj5KMNvCBkK3iAjTqLB1VwcMhcUpsJpLLDMFamMHdeIoRA/S3I/9qBAn5oGkcP7ScIdB6q/v8mVYge/EYt6TKCzyRQrd2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714325458; c=relaxed/simple;
	bh=HQD4jQ5HkydKTzvnGvDeNX5QJju/FQrsqfFapqvF5Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WY60btOoEl98UyDveCDPceVIKMIa3pallW/+Jj673F/Wfkwc8q4Uv6UVsk05Vnv4G0R90Wq18R93XbGzr3fbk7If0isEZ4IRoJbd/6bDN/9HF04EZj3gzUETAzCb1JcqBaoK7Y7MfVDGwz9s+SpoR4C6XP6qyUWBlgAAOtiMqls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZy28LBr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZy28LBr"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e2c725e234so37053275ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 10:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714325456; x=1714930256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLTn4VRFFhj4m0CVQnrNG5MP8gB71OafDWVlE8YmKKQ=;
        b=FZy28LBrQnchgh8zOG5PoqqPnv+Q5ugGqY8ktNP3SPsXeXh1vhTlcFtmgyiQkHbK0I
         fn7I3DRIb/JMWd4DDmr4jYPcVa5p+X/ptOhrNg3CUPpaaUKG6ndxzgk91BN68ZX/j97A
         4reMEE0LUMGixz+VIQDBgZB11e+vpA/bK1Aq3Rly/1b0fNcM9F1+zqG/NU/zyWNoOIw4
         lutFGWJsq+DiC+JW8NCJ7VyW/3Soj09SZmpD3WG4SA+p2omze1Tvr/1f4+5y9kht2Jxd
         F6q/WdzzcAtzfQk6o7ueAg7LwLInKJBVvU0gpBWUBmRdM0np7b8P8PnqOahXqNMkgrWN
         JZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714325456; x=1714930256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLTn4VRFFhj4m0CVQnrNG5MP8gB71OafDWVlE8YmKKQ=;
        b=e/bhi+mrmhyn0O0f9bLDKyl1ak488ZmVGm/Zj6uGeR5pOuzgtjPv1dfT3sdC93p661
         7hDiCRoVawdgp7oMkRg7t3tVKmef8Iih/YchUypD/Y7MkhfP2xOYqpC7VIFm1buUFgcd
         HSXUlbUiEi67EJFziXN4BPUIPG7PpdamdiGTokSyvfPCwopxqFvs2Fl+0Wn8yKDN+thL
         oYfCHLhVh5a7m333YAwcQogEaaQlyBHlGkGnmmQyGIPCyLrHbG+nU35hvjyz5Im2Ni+r
         ASkConYwkHUPQ3PYoJjC4iOytlLgHxysAaUuB8ctVsBvJPV+X2RaEQtKJJo1mMhCXC6J
         T8Pg==
X-Forwarded-Encrypted: i=1; AJvYcCW2XcfwwJ5oTFO7bzYbDNInSYBSuN1vVfwDBy4eSZuNOlZntt0NjXjI2hEJ/Qcpgbdb4BP8uMRFdH5qB+McvHFF03LsSedvlTatxrQ=
X-Gm-Message-State: AOJu0YwcYCaSd5Q0v18TjgGM1vkmhigoztFNBE9eTWG6LjXkaMTPOGKZ
	ZAZQPycWXn7jInRJ/BLkVtKfRAYEGaYvtJxhf11kfohy7QZcO5o4X04DsQ==
X-Google-Smtp-Source: AGHT+IFRudwifYPq51WsBV/mUyGy+/0oofsuGQ6jwPrm4WtMsByRUIi1d6KxKjJ0Up6af8orymvWGA==
X-Received: by 2002:a17:903:228a:b0:1e0:b60f:5de3 with SMTP id b10-20020a170903228a00b001e0b60f5de3mr12144224plh.7.1714325456331;
        Sun, 28 Apr 2024 10:30:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i16-20020a17090332d000b001e0c568ae8fsm18628784plr.192.2024.04.28.10.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 10:30:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 28 Apr 2024 10:30:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Crawford <frank@crawford.emu.id.au>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/4] hwmon (it87): Do not enter configuration mode for
 some chiptypes
Message-ID: <605433a1-b88e-4c85-b855-67861efc13e9@roeck-us.net>
References: <20240428060653.2425296-1-frank@crawford.emu.id.au>
 <20240428060653.2425296-3-frank@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240428060653.2425296-3-frank@crawford.emu.id.au>

On Sun, Apr 28, 2024 at 04:06:34PM +1000, Frank Crawford wrote:
> Update the configuration mode entry code to allow conditional entry, and
> apply to all calls.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied.

Guenter
