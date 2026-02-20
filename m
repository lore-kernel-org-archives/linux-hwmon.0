Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43522FF154
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 20:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771619339; cv=none; b=T/wnHK2QChLDL6j/5P2Uxk/IFvfFq0wbGNRduaop9DaVQ//NtcJKlwR+Ugpb89l0xe6c5z7HAkYwmySHd6OOiDr7zPK6qSKpL5gWX2e1/Sd6BIKJfU50SLk7/k2DpDift3ohDupfwJMxnWQRlZD1INTUlWpR6RBDYaoStV/SvZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771619339; c=relaxed/simple;
	bh=gnema179pTpGLN+OSlf6d17mB094kBdEWZyznjbRkD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctfCw2UEpJ9CcIUqe4KKaARj5TuimM5EDkZ+sxGBWik0DuPfxWoqswpVVtgYUX4P1jN+RohdUC7KwmRbxyge/OUpWyp8GEXhl9rE31ONcVM17HvHOWcsJdaBKeoG91o70Io3Fdn7//EQq4LiXd2c73Q5/SwQ9vVQjU1qKn8Wmr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSqlZ0Ej; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSqlZ0Ej"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ba94dbf739so2774037eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 12:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771619338; x=1772224138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMApIhV11Ph0ajN83Dv2UggV4O4deuQsMDYOR6ISibA=;
        b=XSqlZ0EjsgGXhCbu0u2yLf/qSPK/YM9Zscr4YAR/x8hLv3pYq9clD5NUhgwnoNUaNe
         vJCAX7KA4HUHfKDvFbsVo9cDNDB4DhEhB9foyohFvJLiZvTLTwz3lS4+djH2gpNQJwVO
         TT7QBWEzAbaUpMPqyF6nmnyznkpfxzwd4FMZHVQkD93gPI+bRKnF0AZgafPhnvF6SEDu
         Lf70JToc+ymNLnmfPakuFve73NMgM22YaDw7euJ+4RJJQZC9LotyaLFSZRFY9TsSHD2/
         EWk3Gx3zTIIZPc+qRzlJmVFv/cSpU+O53X4uP25UACPfIxFsELWcSYQ5NulgjcqOwDxz
         mplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771619338; x=1772224138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OMApIhV11Ph0ajN83Dv2UggV4O4deuQsMDYOR6ISibA=;
        b=Hf130HxaZ1SgVkpZVulyCp7VuLG9CxYpG8jz3Cj26Xs7zqpLP9Ll5OqCX8r3MLitCG
         /1UY5eE8wq2FwuYLEbVdJpdNjFQfcilDxD/UvOAuCfwZK9C5Y8WIeJ9Nmcwj6baDQr7d
         yw+cxO+Lm9UlBCCGShWPZKgDqEuwK/rCqBMHkJ/waPjH4ipZ7qJIHeADBq3a+XTdzX3n
         F0LjYOSU4GO5SqeOxB3/9XXkDy+LyFSnvU7E6CGU9p7eIfDnjNYtGvawg9itiMW2RvBQ
         Zk/bBA9HWFFZLI/ynbZsuMUiILZd7nGwo8xS3zg61pJQ+xyyywT/jpxPPkJNyYtxCqOu
         2/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRSpe+/EJN8s9FF0Iij2Bawz6j6J88YyftGyNHu65f5M3tt8A397LUWeIJ67B4DH47B6GNKa3PEIYx9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPevCa3U4GudVRRR4bFmkCn5kT7yYSlf+PCNILCJIqkor3ZKRj
	/McDxHnQgP26u542p+czFkuBPyuoFJPeWXfBUcJNIs8pF91UWO5bVDGq
X-Gm-Gg: AZuq6aLCvslo5JbGgABxYibg1PI4x3B2iu0zCLkhuwsOsgsUWNxsapg6dhff0KDCctT
	nX3SNSYnd+cvlEL30IGJPEtSmCV9cBKsoLKF5cPhMqehikkrTuxI16B07U9S7PoAAEMNUfEbIRz
	v/0eGr4YntupGBBBW8JfycRGrgQ6Y8jrQ15fEoouy2niH8juxio4OqASxQ+++J3Iyx5JFJCVMOj
	rhO4NyjposQWjdYhhJeR0JpEHb2gYSD+1kiRkhS4N2LSDIZd0kvNzJDE+HAEAzLTr6ZBcqxVv4G
	hb+rl4ZDkFmzAGVLDGyC9l8J1pGNTDjgd0NZvtHHtc9JyaFbmz6zJ8JLcOOp/+AyDQNDdLzwfkC
	xuv0tPwr6XWCMT+NYSdo+ePaR7lOGWVBFC+YBI/xuWt7oJvlCKdzPfRrERXAOegH2jRgV/hRedr
	Uw29ZMB8VJZyVu2PRprnOePcNsP+VrDKawPn41
X-Received: by 2002:a05:7300:e830:b0:2ba:a3f2:958c with SMTP id 5a478bee46e88-2bd7b88c56bmr444143eec.0.1771619337547;
        Fri, 20 Feb 2026 12:28:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe8293sm151468eec.16.2026.02.20.12.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 12:28:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Feb 2026 12:28:56 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] hwmon: (gpd-fan) Add GPD Win 5
Message-ID: <228d52ca-2215-43ee-a790-b0bc390ff73f@roeck-us.net>
References: <20260220161601.2344291-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220161601.2344291-1-lkml@antheas.dev>

On Fri, Feb 20, 2026 at 05:16:01PM +0100, Antheas Kapenekakis wrote:
> The GPD Win 5 is a new device by GPD with an AMD AI MAX 385/395 chip.
> It uses the same fan control registers as the GPD Win Duo. This
> information was provided by GPD.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---

Applied.

Thanks,
Guenter
