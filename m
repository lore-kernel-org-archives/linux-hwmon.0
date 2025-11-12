Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7360D29DB64
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 20:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762978168; cv=none; b=MB04iMF2DotDIuA9OBH+rteRqrqecBf3IPSpOdxX3uWtHgoxbfjR+JueRF3mqh1prvEbSLrYr9dQFPCaqXxq0O/jRYiL1C/vHT5y74xdhR+kfwRM6Uv+7eKSiCptbgrHfIIIOWL4lvBYyi5PWUcL0cxvFSY7PqtZQZsRVMY4gFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762978168; c=relaxed/simple;
	bh=Er3oR6+PkdlXB4XEzW4SKH+apkSu3gszkGr+FTLFVQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsbJ3+0o8O6vjpGYTVNYUxsB1Ev3XbJ3+wo7t3kgULwJCftcP6CsWf07afd8fp6uuM9PuLWp49u1JXE6EzWQTEEsVV2vbQT+R/x6nMjprcmgRrvNQs3ukdYDFb6CKwnMz6ojWwospYtuVbI2umzJKDoUGqxlNwdOYI1YY6S2tsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Egm8LDRI; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Egm8LDRI"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-298145fe27eso311585ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 12:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762978166; x=1763582966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmvW00LBZ50ailbcS9XTnsttPz016ujPos9JYGgCAT4=;
        b=Egm8LDRIswfqLLZ9M0ef0fAphIw5jfBH3MhXlu5EwvyG6nTXpcAf3k5+mBwpPvai91
         lOXgxYPCkv0B757PDkO8lZW8TpzpCWWcNHOEWLxuN2Bsjz87fQeRyxI3Q3EBvWwiGydJ
         Mt0TZKuaZjKFmVdHtfREesMcY4Ceq5jilGQ0HaWyFXfnHOWDAkTfUNyORJ3dscADIc24
         MeZ1lNDkQxd04itdd6XugVokwcow9zlnqDDKpCja7YsnfHq72ncVjTv1Ve2DBZ3tNyhm
         VhF6lrJyNqGqFlNaK9K9kuvfecWf1utpuooAX0NSZtNb2ujNVuWxYAPce7UcyIAxPGnQ
         NRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762978166; x=1763582966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NmvW00LBZ50ailbcS9XTnsttPz016ujPos9JYGgCAT4=;
        b=ilT4SEF4G8tFIgsx9mAZ/5pH8RYuoKLR9fkR9hU/2/MyVRzDGt9Nib4Lo5tQsd6F+q
         1oteJsWNnkfmBXRBjuLi/BMLmcGKuqixk3cynk8VxgQ5jpUjltyTfv8U7ONXGr0DcPsx
         Ndo4JbUZ8BEuhG4EMFgSOLG4XgfQgSNzhZvMQMbaM/7feg5lnCevodlZ1fIrtgRIcY2R
         PEW/rMoaHw0xlYPffedwFbiPbkyGG5D1TGzKRnzEFA5X55skXwlkD7yvTSEenjkXj5KI
         JDVvNdKORd4XaLe/cGji3Lf92QsRrxaszlW/13bfG/XN2W01bPjINUvjusmI/mEO0Y0c
         2IYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuivQZFt0ahQQqqCkecu3O2pSItwtFYH01wH9wHtxkqun/zzuV4hBdaS9+WZRYd0FCOTSXJOWuqKZjaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMyzCD/z0yrJxZ4ELQte9lZxnwErQP50oIS2isyHeDRGYrZH4l
	FOzB65zdipg3+/kt7dH7OYunDw0GJAT1Mg19u37JhPcE/cPOp/jSNtit
X-Gm-Gg: ASbGncv07ocqV3AP3u4R5VPUGU0b0L87uei65tjX6K9IYpNLnETwqEJbDXSOas3oFLV
	7YfG8iNshqklNhRbrg37mZvk1m/cneLDg4nc+bI40j0XfCnJKYCXEjkzT39KvUVsq2/2/2i0MiO
	/EHNo9HMd7Xe9e1ZTm6vwxDGZq5jOHfXlJLefUJUWnHBXAW9aHqlp+TO+C++ElGAHS9dlWjzXcD
	fGRRBHogHp7+ObxFvrzNynAWnB+36bGkChkHLvPnOfoVe49e1cerJFJqW2FkHi8xnaBylQpX4Su
	iLWoUcFTESkLgfBrKqpL6qGefUuoAkS6T7v4V4iTyvl2eZmwtLdHfOCYLaJbI9PbE6VQ0ZGZNCw
	oSXxptZo+i7KnyEIZxNN+A9/Le74AR6O0YXgl2bHJ6c+dGrPo7Wt22oDUlf1MJqhGnwpXE201NM
	Y4lzhi9WgqnOAn
X-Google-Smtp-Source: AGHT+IFItecs7CrhbyEkdqRwaoHcd+iAO6zPDCEwo/LpsTI1JbO3EYuhCISQUIPuyHp328lDKaraXA==
X-Received: by 2002:a17:902:f70a:b0:290:c516:8c53 with SMTP id d9443c01a7336-2984eddf03dmr51151495ad.40.1762978165661;
        Wed, 12 Nov 2025 12:09:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dce80f3sm39020015ad.106.2025.11.12.12.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 12:09:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 12:09:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Reznichenko <igor@reznichenko.net>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v4 2/2] hwmon: Add TSC1641 I2C power monitor driver
Message-ID: <c02c8209-8f96-4ff7-992d-c81af54d5604@roeck-us.net>
References: <20251105201406.1210856-1-igor@reznichenko.net>
 <20251105201406.1210856-3-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105201406.1210856-3-igor@reznichenko.net>

On Wed, Nov 05, 2025 at 12:14:06PM -0800, Igor Reznichenko wrote:
> Add a driver for the ST Microelectronics TSC1641 16-bit high-precision
> power monitor. The driver supports reading bus voltage, current, power,
> and temperature. Sysfs attributes are exposed for shunt resistor and
> update interval. The driver integrates with the hwmon subsystem and
> supports optional ALERT pin polarity configuration.
> 
> Signed-off-by: Igor Reznichenko <igor@reznichenko.net>

Applied.

Thanks,
Guenter
