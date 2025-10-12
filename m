Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB892F0C58
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760292755; cv=none; b=F0Dz+wir64Ilg5slRjYuvnsHog6iWf7YwDRqjIyPZFzOhrfiriyiO9bln+6OwdeiIjLt7S4OZUoWK062tNK1+/nipzaAHT0bQMYpatf/YU1qnVShEwkTkCn3JE0GX4bc6Jp9zKg4X3Lwg4evLBszxtbxUFn4xGSR03X1UDyVBic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760292755; c=relaxed/simple;
	bh=wktS8hk5SdONpr7hDtnum8JkZBzGQGtSnk+ZlarPI74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZpTyxc17dt65URFiUVwj8x0XCWIA4DIObq6vDpKQDOTdvbv3Cf3VTNINC25yyu3x3MbJdX/ThwySLPl8BfL2FbYykrRJZACtPXoXlK0PHskahzDZ34cj/yCFBU1uiXyt4mJr/S2kjCyvvOW4wdwzegobzP4cu0tAtBYHGoVV3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpkcvHz/; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpkcvHz/"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b57bf560703so2266614a12.2
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 11:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760292753; x=1760897553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VC8GXXSQpIv/LKtCgeHxQw5d2s/g3mf02Ku+jqIhxz8=;
        b=MpkcvHz/IelBtULM9/eV1l5nDHrJVxbX0fLvplEH/dYq+k3UKStAxCsl5b7HevAzPJ
         mqK9qEijclCHchOkQ6BZEZWyM8pYaLWoHSQSBBEdg+27TlFY0+P28ifi1Zt9wK5TWS7Q
         8fPmft4rT8OmMPaG/2iRVEUGreTlJGPpWb2lpB7BTogFO8wzoi5kjJmx3Y3od7zPaYdA
         Lnr54u9aVj6hJ9qSNOmh1P6tIxCT9PMASerrHjYocdqk4364qLBn14SghrlblT65hIEO
         Iessb4Wj7kD7q/SlLiXDtkMpa7hkGKIOMxDlEvQqMUXOEeJs85FhhbB0pyRYcPXbWLr4
         xTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760292753; x=1760897553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VC8GXXSQpIv/LKtCgeHxQw5d2s/g3mf02Ku+jqIhxz8=;
        b=iFJ0PCO74D1yWYOAsacbL5egAQX79zu+YbFw1ZKZyCQC+V+HHqrdEBrYMwEEKbqzsc
         8Z/mk8KBuvCrmundAmBCqfUAwGRmglq8YJdHYSh/QhEUs/sUQeHDb3jvSSXQuNEwn0Aq
         zmkbJvO4CHE4x8pMoNmV6pMDDwNJqdS0YbOdJJ7rCsCcfackYT/Uejn5O+if8nTPURRk
         UZzS+6k8FeybXqNcKjUbip4493E3RcHgub04nMpGg0HLHtQ0nIFzQgmoNVYQJ0KY+hD8
         Ojy2qfFlWKkf6urIHoaASAndepa68ChQRNMyNoeX7Q3OUqM6mLlfA9C+HMu81TgnocJG
         yAOw==
X-Forwarded-Encrypted: i=1; AJvYcCXMp/jjv1Rx0kv9o6uJQA+rT2bpNtNsToZiVHtTTYqYtKulrfwTd2yUHrypxcqs2WH0+dMdSgLcNBI4Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa71SrMdM3V/YfZ0/DOsR4tMIQYzUF0N9XdUmA5OpeyoXHeZ7w
	gKyX6e6iUl4k/CDRMvH/JHIY4kY9R50LIlCw76vl3GC7Hj3CQwg/620x
X-Gm-Gg: ASbGncuy/5NHMfAtrd7RmNlNtIkdlChMI753KTqN/oGcVDTAJfhTCkTJyDg18bBw3Vv
	AIwwhFva9VZGUiH4vS1RCh4rTGXj1WKZjUbDY00cSWy9e1wgEXq+xy0NaumZj/r0YRw8CQz1IBo
	wi32d9v222mFUIkNiUWSrdEe+AypsvpHSxN2FHVlhgCaujSZi4fje9eVDN/kZvkEy92N1C7h7js
	NXxt8l4Px6Mbl+P/cyhk5OCMlSeCcw5spd6upQCxDBRBc79lRnnuhkQvOVTnX4vs9SCGhKEMUJe
	94H6AZxJE0evOQuxCYd4nbVYHs2Pp63yWc1NSoxF/UPYvBmCnsUSBYiVYkQkasxyragXK2PsjPr
	PlNNUFOnH83xE23emdPi2yFNzS8f/l3HOHmwPpAQDa/DGWLe5O5h4kqAw0flsro6j
X-Google-Smtp-Source: AGHT+IEGCa6rp5AY25/sXZIN5SM/UqExUQocFllSvQfqN7W2GP0rr3zSmTZkdcqeZqOv2pX50YTOYw==
X-Received: by 2002:a17:903:2d1:b0:24c:965a:f97e with SMTP id d9443c01a7336-29027356aa7mr255105745ad.2.1760292753291;
        Sun, 12 Oct 2025 11:12:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de9febsm112201485ad.7.2025.10.12.11.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:12:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 11:12:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/3] hwmon: (peci/dimmtemp) add Intel Emerald Rapids
 platform support
Message-ID: <da2e5d5e-4bd7-46a8-a664-2f5e0d69b28d@roeck-us.net>
References: <20251006215321.5036-1-fr0st61te@gmail.com>
 <20251006215321.5036-3-fr0st61te@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006215321.5036-3-fr0st61te@gmail.com>

On Tue, Oct 07, 2025 at 12:53:20AM +0300, Ivan Mikhaylov wrote:
> Extend the functionality of hwmon (peci/dimmtemp) for Emerald Rapids
> platform.
> 
> The patch has been tested on a 5S system with 16 DIMMs installed.
> Verified read of DIMM temperature thresholds & temperature.
> 
> Using Sapphire's callbacks about getting thresholds because it's same
> platform/socket.
> 
> Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

Applied to hwmon-next.

Thanks,
Guenter
