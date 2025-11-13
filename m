Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B79235292D
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 17:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763055730; cv=none; b=MDY9v7Dgespmce2toj6WfBKGSH4xBvFs7L0qOd4qzRp9bG9sxdtK+H64llf2Q/T06ga89hBj4zbNJcA89kwRI4GW5ccwB7h7qcLzXDkFivzC++undgzSXVt+1/uIGcDa34KQlRwH+AgOrPzM4IQFjvM5GRZvsh6+S8IV9Un7Cfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763055730; c=relaxed/simple;
	bh=5k3TYzWX0tli7R5eZBUCXexnSC4WzqvF6TKvLC5ZZe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXRIz1dvaSs8Sh4CTszw8XkjLCviTXkw101c8HcBYV5bRBd5XAEpx6iE2ees0sFARrStG609ZVCPa2Dn098BHtP3fmOhmrNeFHi5h5ibCiTsXarf53EFyildl3+1qoWNsNgHjQAcdDFOwkOmu/kBH7qWALBpg5tLPKWCcYTp8F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTCvg3wn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTCvg3wn"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29516a36affso10989225ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Nov 2025 09:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763055726; x=1763660526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/YxN0IaaSRtHs4Twn/apCZNadyeY35CF8Eo/Wvzl0o=;
        b=NTCvg3wnt8AXUJH+E5DOQU82RPMFtQ50xmTT0sI9mj2KynQNE5uyhHlUJEcIhoNaxh
         zMZnzgEtiiKhB1jju4BC3bkSTnfOzNDWWktQfJ/wRLwd+/GeKfRHEEf0s7DDUaGnq/gx
         S2bzH2G6ShLnc2DxrspkEN9AcdPR6APlMsoXp7q0EmOchgGTEWGPPDD/npPc43KI4uBn
         wxDo3qAo+9qWmUhl8VPLoCuP+cI/+SPR2QxCMTZOKuRDCzrDW9IXZqFGJMEBE3Weuwx0
         Afo2xUMVyFKvESKcFIB70XYPu0YxBPcIMXB8ZvUbA8c9OLj+MvTdeWjg12VNJ44zvR5x
         zifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763055726; x=1763660526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q/YxN0IaaSRtHs4Twn/apCZNadyeY35CF8Eo/Wvzl0o=;
        b=WT7A1H/HhYMTEHOG9w/gFZt/0+xBRZtR1ll3cLCG7mkI4sLukZSGnxNqdsDlntvvRJ
         WuDOF1S+hh8UjEmoK2JL9H30xsQbFaH/wdS+m6vjxS+x76XEO0eOJyFmR+QmcO5QCTY4
         Ad6qwOCHtWGo6ueHQCuE3lrYZMYppNBmAUUaJyY/geCnRY3Ji1CKSxJXwwgLlMPzsQf6
         yfjqY9uYU0d90Nkbfd4LgCzNfymdKu5N+wExsUemYbRjwabW+PDmRHvR61xf3Ni2TZOj
         Qa/4pvIWmcAJQZkBwKYZ6+dEC97MpGdBNkiahV7cDmIm+r1Skam8Nlh/0lA9fQYgxTEs
         dg3A==
X-Gm-Message-State: AOJu0YzctbKTLJp1DnDRhpzO1v9oLpg0+y73+wNVJQfrFjt99js1VpTs
	wwVf1Ji2iG+gFX/RK7Cvvdt8DtTk1A724UfKzulwwb6Rlz+W4UdL/qtx
X-Gm-Gg: ASbGncsf8ZglgkhSuQ+Rvvklom5bzlSNZA0YiPgqehcnbK0ohUcQI+aTC75NXtIy6XQ
	UhbACyLZaTQnswWl45Ap3Dn5G10HmgC2qYF1FYdwIdgAviUiugG/QU6zYq4vSHXbMV6X/5iIwP+
	bY117fVnodMjzUR1Kjen66SMtG1DmcdcThMcisXvgUBik72fa/BXqMf2Ht86Rw2SzQD4vSWBqU8
	ZhFsKDNw684vKuZOt91AzU3SGdO43Okk/QOlOLl12xVfh9jdZPxPoRth8XfwgFEfjHA3khC0dQ8
	9oCSBTj9gJNptQqL4jQ+q0LyzcJaj6/DY+rX8xfTL4BWJxo9N3N/103g5XoKEFRaax3fwiE/31r
	CSUmIlUkPwBZP3onHQTXG/+JWLiCpPH5qe05wE9TMrYC20T3pZ9YWINd0pwgDln38XUtU7LBk1+
	J6rI/P4ckvhK2T
X-Google-Smtp-Source: AGHT+IE/pJRY3nngi2DgKMYCqUyhmOWVCR3MREP/oPv+Ub4Rm6wTg7qm8PAbN3zePLKiTi0tm13/bQ==
X-Received: by 2002:a17:903:94e:b0:294:cc1d:e28d with SMTP id d9443c01a7336-2984ed776femr103313625ad.25.1763055726547;
        Thu, 13 Nov 2025 09:42:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d76sm31278425ad.68.2025.11.13.09.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 09:42:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Nov 2025 09:42:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com
Subject: Re: [PATCH] hwmon: (lm75) Add software-based alarm support for NXP
 P3T1750/P3T1755
Message-ID: <0b7b6086-ec1c-4623-b836-a1450d39b44e@roeck-us.net>
References: <20251113112011.28909-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113112011.28909-1-lakshay.piplani@nxp.com>

On Thu, Nov 13, 2025 at 04:50:11PM +0530, Lakshay Piplani wrote:
> NXP P3T1750/P3T1755 does not provide readable alarm/status bits. To support
> the standard tempX_alarm attribute, implement the comparator mode threshold
> checks in the software using THIGH and TLOW registers.
> 

The ABI says "The driver should just reflect the hardware implementation",
which really means that it should not try to implement software based
alarm attributes.

This is in line with all other drivers: We don't try to simulate alarms if
not provided by hardware. The key point here is that the absence of alarm
attributes means that userspace has to poll temperature values to determine
if there is an alarm or not. This gets lost here: As long as the alarm file
is not read, the driver won't report an alarm. Userspace polling on the
alarm attribute (using the poll or epoll system call, or udev events) won't
get notified and miss that an alarm was triggered. This would be much worse
than the current situation.

Granted, many drivers don't implement interrupts and would also not get
notified, but that is a driver limitation and not an argument for
implementing software based alarms.

Guenter
