Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1089E2BCF5;
	Thu, 26 Dec 2024 21:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735247123; cv=none; b=ODvIeSKzGnE85BsXiDQn3MD0DisB+rPIIqmsDGY+GjiqennktpUaJGYPBHtqJW/yW/xqrc8W6Pkd680K8eorQvJAdii7gMGW6q6mrYiNdbBmJW564YZK2iOl1Khvyt89pFodrtH79qexCiFyBBwCSX9IDsebtRHOZyiquTbnQI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735247123; c=relaxed/simple;
	bh=24p/IFNBPXpitaN7fvpONTaFdAvLIIYfJEziCWKHaM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBnTX/+mcQvjuGUO971jj5kkgWCXZYNWpkjXi5yXoY4RCOVR4UMqbd7TMIf5V0zjCwWWLvaIRODZzfglO2CmKcKB6ScceLh09IMfFzeN8yR7SqL9lDX7P4R6mLcw96S+Vc7rznqRrxF6m4OO6cYjOZd4hAWqRdFUPM30iE5WGKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUrWgA1L; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUrWgA1L"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2167141dfa1so77277845ad.1;
        Thu, 26 Dec 2024 13:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735247120; x=1735851920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKS7b0yMpMXSyY647yNBALiAX0XwPDv68wynTZYjT3k=;
        b=YUrWgA1Lu+70ZDasq5xfxfQd9MSelokO4RUjlb6DmSdsfGvCv/VtlJTZ1CDHA7N++f
         elowhO7djZLq47emK8u31kzwO5rIJvz1MsSbqZquF5+/4ERVXNElr2u8msEXMGSL+dSI
         dk+u7wZme7PfNCzdfMVDX/PAveXZ7IV7uTLT0/5SvUESUzvjwpRnFNa7mF9l4ZaKfgo6
         zzaAVm0x0gK/+aJ7CUfQfE8nddoj58VXGLOl/PYKBb+3RkRnk94CvaYtiw3BhWZEc85n
         9QVb/xhtGqEGXqIglb60jnLnvWmS9lJSuIsFC07fLn/+IQp22TweX35KayvRYK8ZyrJl
         yE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735247120; x=1735851920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKS7b0yMpMXSyY647yNBALiAX0XwPDv68wynTZYjT3k=;
        b=E0BsyndxgJbOF+Kmu/91v+tLvKbTkDcQy+t7TYpB/S/EbafeZ22DbnqpffLsTMFelQ
         kIc7hy8zL0csAnSjcgnaLAKgmv4mueY6HhBPXcQLRox/CY5GXgwZD7LbY4QHcxvdW9md
         BJH7b7fn/V4uz6Oad2+z/AyX9DvLZ2Kj+rxJKFIXDexFPp8hzamjtsudyEWpYNN1m576
         qA9UG1aw1ub7S7oCpmI4nCW3as/YH9VbiCGtXmkAc+AXhFH7NSEIwCspSfw2volF0Veq
         Br22osSKfzeALOIE6yK6cLv1GT8ulpXIVvFs/d7iZXdT4cNBO0Tv/fzxZuBaG8n4/2Ll
         vb9A==
X-Forwarded-Encrypted: i=1; AJvYcCW86/kEFTRnzlDp1dRjyBJJuRGZB3IeVkyU1/ePem2TqbbWuFoig/DlSk5CoLVyrphzl2lWdmeh4GcnVdJJ@vger.kernel.org, AJvYcCWUxH0QQazBgdS80ZkzevXoZ5PEf2dP8BuGyA2QP5uUPptfg7LA2Xb2kknfU1EFPRvGCkQCzbxy1f2HcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhsGgfedyxRU7aFrT10+lT0a0i2UcdeZOr4E/YeMN/yK4BCJvP
	XviIhVFs/IgrAK4JJ3VupLom0tIf80/QlDdFb30IpOeMu0fKXq5ojp1Teg==
X-Gm-Gg: ASbGncvIeKGDBc632awZrVYX4QgwXCV/+n1KwAvkAmaYV4U/8YdC6kdAdG8soGSSz89
	kWzr6e9r93mYlEenDHL8L9DT+OnAkCOJiHbuofJ4+flffo27rCj5a/8cpaEJ/x4h0veneedZgeQ
	xfDk6P+n56VgJqGD7Z+zVzYNmARByTj1zz2GQplfb/1iCh8e0OyfVsHby9FbExB0HVg25TDwZ2m
	Gb0KMs2k4ckLpIXIbZUFI5BPZIuZNY6ljRMw0ALybo8MCVtg8GWfK7+Sf8znKfqHWM8rQ==
X-Google-Smtp-Source: AGHT+IGovdLVOL7AmFE2qB2MWuL+CsbkSMJL0bAiNlQjrw1DuQnOTQ6ykfPW6vB/k+yaXikYGsFZkA==
X-Received: by 2002:a17:903:41c8:b0:215:8847:4377 with SMTP id d9443c01a7336-219e6cf8584mr387899465ad.15.1735247120336;
        Thu, 26 Dec 2024 13:05:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96e85csm123817195ad.61.2024.12.26.13.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 13:05:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 26 Dec 2024 13:05:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: tjakobi@math.uni-bielefeld.de
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] hwmon: (oxp-sensors) Cache state of PWM enable mode
Message-ID: <94e512e0-8105-4123-b9be-8a9805f7cfca@roeck-us.net>
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <80c85a5d219eba0c10d6927c3f90bbc3ad6043a1.1735232354.git.tjakobi@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80c85a5d219eba0c10d6927c3f90bbc3ad6043a1.1735232354.git.tjakobi@math.uni-bielefeld.de>

On Thu, Dec 26, 2024 at 06:00:19PM +0100, tjakobi@math.uni-bielefeld.de wrote:
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> 
> The driver is in full control of the enable mode, so we
> don't need to read it from HW every single time.
> 

That is not a reason for adding that much additional code.
What is the problem that is being solved, and why is it worth that much
additional code ?

Plus, again, all those runtime feature checks in attribute handling
code are completely wrong.

Guenter
