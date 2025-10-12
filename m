Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903F82F25FC
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760292448; cv=none; b=gJpsmxBdw9ZCLKCFrC9oi00xzgFNpwiOynaaxbU3D8QUS4FH8/cdJ9gQdUceIYTzjKYe1fZqQdY7YrYzBy4wonjaVae1VYJAOwMIYy2qnAWTBmJSNQmKSIi5RvGg77/chJ1iN9V+lPlvB9r3Okymh7N3fJ0faKRX5q8nUbDWFMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760292448; c=relaxed/simple;
	bh=VYct5uqgOuBPtnr/agOuQUfGSRixsl50ArqFin74dUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owju9RnOx0+OJZ0niL+7RrCtGLMLyt/tWFbpA1TpI/Zt3TJVQwcJUD3t/napqC4VFtoDWL8vjKe19lncGsEPVn+z1r5WmL8fQehvNv+Fbp2JPDmexwAkU5d/7T2aaKM4iq8PP6eFSLobo26zKctUaxjcKZdMiPgPyLRYRNLhGvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8oxZITE; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8oxZITE"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-33082aed31dso3644913a91.3
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 11:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760292445; x=1760897245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7i+q+CJzc7d/v15V/dcB6nP6r4+CnOGrYGYF3/B82s=;
        b=a8oxZITEoFTIaMs3sUEN+J3AuMfdkq1Xix0lsXac39/6eTdfTcI0cNYUbeMCSCoqKq
         EzRWK36qM29yzLB8SFQYMEYo6HIrMGeKiEjxWQeLMqB3Hf0Z8v9rv6CTVY1IwcjKjh8T
         ykElsKQUQLclS+i+6dfQ2Hlnozik/ng0EHEoQjeEO3f0ttIBXsnMD72SDD1Uhzr80fgo
         Hlpyn7+cDN2GWxwS8C6wM1NLl7bCT82yUo41juHk1G1E9Jg47K2Rv2+2iUZKB/zwddAS
         D4tINvlXNy68bEeTwZWgi+2MhogCQ76h6kBeCDb77wpNSnLnTmI/6bAqAj8MKfJlpRnt
         Fekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760292445; x=1760897245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7i+q+CJzc7d/v15V/dcB6nP6r4+CnOGrYGYF3/B82s=;
        b=XyvWjaoma/gP2KnLwRgJQmIj+q6BMgs7mm+b1TM1no3kBCy1tu8vgkWSD88+M4l4Q3
         LTmWnTEcdLc1Vv7rhOwRSipIJcqaUW5sq/h6jlAb10MtoWILBpwODDFcqAsA5krqjIL7
         EK8EWr9s57016aV8Blwr7TRQoseK5XVvt//IRWxr/BcRXoJY8CP2yhHH5DUWV8aPaR79
         hTVFHm/1WhfE+cgruVk9J2HXl+WYoMc9TSGJnkxbz1I+sR7fcOfuphJfrZvvwJwcuwJ8
         /kyDYyvkmr3PJAx6El8hHPU74qud6V+6yFDcPMaOODsn5G2n4VOG/WlnJ7WpFGBHYr1b
         i+CA==
X-Forwarded-Encrypted: i=1; AJvYcCV5ctP/s0XeLHd3hQfKc5cliC/NUy6+uRc9es9WCR8cIPxi+bax89Id4G1On/wLAQwVyb/ygAZNUHJ+hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpEhXsNjgT+v6LRVYUYc+zjb0nNqbRECEZuI58vVUPNCnibKvL
	ZSBGgDiqG+XDIAyM+/KwL0RSH0un5iI/BvbM9a2JSSktVV3A4GACj/Ni
X-Gm-Gg: ASbGnctCN/bD5dzwbi+J0pOtUX/3TF9EW9ojWuExw3j4Y/Vc2r+/aoiEw9ig6ILbPbi
	Djx4byLjVUHavt7OiuvLYHEZXLDm3dy+/OuzvA7Dk6CNAa844DPMqUu/PrKGfnAC9l0q8AsLSn8
	3JA9pF3jfJ394ZK+VG0X2vI6k+3mTrRGCKsplGwsCYffOoskpdfzGs64YEbxK/YgOCjtRs0/xZe
	CA1+TxevGdls/wHtFLCOt9/D6MFtgDE+kmS7uH5tmYNvtKV2lRjVLhS2VWoTe7BbiHvu8p4sHlf
	0TVnX4kqowCpdpZmd5xPRJ5kUCj/9R/F6bRT+GMC+mZNd0gufA3jOEK1juP0jgSrN4oGESCmSwq
	7dSruoN9cr/AsIiQ4mu3tJsbvQqg21K/rrgNZHmoBh3DdYm0Fp1FYIQ==
X-Google-Smtp-Source: AGHT+IEGrnByCpct5tS92VZPaK79GTSVnUDzgOIkV+hPgZq4ya1QY0ZSwDjmPxxTVw7TrNKsMHNs3Q==
X-Received: by 2002:a17:90b:4990:b0:338:3b73:39ce with SMTP id 98e67ed59e1d1-33b5138e3a7mr25400722a91.25.1760292444891;
        Sun, 12 Oct 2025 11:07:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d386sm9672026a91.5.2025.10.12.11.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:07:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 11:07:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ranganath V N <vnranganath.20@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] hwmon: sht3x: initialize variable 'ret' in
 update_interval_write().
Message-ID: <e2ae44a3-b3c8-4f90-a180-c619e1854317@roeck-us.net>
References: <20251012-my_driver_work-v1-1-9e5fe6de51f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251012-my_driver_work-v1-1-9e5fe6de51f4@gmail.com>

On Sun, Oct 12, 2025 at 05:13:27PM +0530, Ranganath V N wrote:
> fix for the smatch errors:
> drivers/hwmon/sht3x.c:606 update_interval_write() error: uninitialized symbol 'ret'.
> 
> The warning can occur when both the data->mode and mode which is
> derived from get_mode_from_update_interval() are zero.
> In this case, no i2c command is sent and ret remains undefined
> before reaching the coman return path.
> 
> When both data->mode and mode are zero, the device remains in
> single shot mode and no configuration change is required.
> In such cases, it is correct to treat the operation as successful
> without issuing any i2c transfer.

Actually, in this case, the code enters

       if (mode == data->mode) {
                mutex_unlock(&data->data_lock);
                return 0;
        }

meaning the problem does not actually exist because 'ret' will be
initialized if either 'mode' or 'data->mode' is != 0. That means
the smatch report is a false positive, and this patch is not required.

Guenter
