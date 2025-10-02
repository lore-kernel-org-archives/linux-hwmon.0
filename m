Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2145226D4C7
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Oct 2025 20:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759438467; cv=none; b=PSsPz3ciA9/MqQ8bv/1OPZm2L/WsV8+R8q2y3cpaVsxAC/55MdqxC3kYAlHmzgojWllSIv6R+t6fd28jdMtt4Fp3HOzG/tudRRWe3CKTiYZwcdLroTZLm5qzWhK36MBa6bhs88RaGtkXXGpSQRY0qZ2BBwbkjSXPOZgRIspbNhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759438467; c=relaxed/simple;
	bh=CMLY035keOpu6fjvgp4q742qgsi3l+0VCoZ7cJkByO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTgmVtWGWELT6Owz9FcaHTAFUvA2eWQgqSYOVp9Z1sYmY3UaeGi6824/3gESqrot8//s2ZUNAwqemtRKTmKDMSEcGg/yQee6Y9QkJiRLBN9ZXF/HkQvxPjq1wGT8SItjnnVTHAgB1gk66GNDC7zhU5Zu5WOoQ8zmEkh7BYA1+/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXrHVqtp; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXrHVqtp"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27ee41e0798so21251915ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Oct 2025 13:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759438465; x=1760043265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8aA8eYQbOy4enGJKPbNIIg5fF5qMbQf/5jHtVJ5nvc=;
        b=NXrHVqtpynEKEJtRLn3ibfwDo0wiI74vYMTMCrXilA0Q2GOUn3FEhKArWtalnN7R5t
         WlgLPEFzz0HUvEKdlg9jmd34Z7yOPI5JUMDdduoxfc8KQc1M1zVbi4B5MRM3snlv0d/Q
         viKoZBsftnzUZjL9jbZEiXr4ct7IiIt5cdf7SWZmAF5Uc4TdrAs7ulQgmthFxBRq10X6
         zfXg+yWxw25E61TYruyO+bkkvvadLdDSSC7FTOFT8d9SIzJSDF2cC931iQ4wU0eMsshq
         FdJB07Ga14vEhGV7T4yxpxqekzIC767EE3B3flKxFGNWIiy+GF05ITyjLEMJ5fVxmu+s
         nRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759438465; x=1760043265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8aA8eYQbOy4enGJKPbNIIg5fF5qMbQf/5jHtVJ5nvc=;
        b=Quawmn9qrVcj4LCq86ry23zc64xJi5Q5BGbngKXcnKSx9+/sn6GEof3pk/jUHYHUvg
         N4ujd2G2Kxs4eYWhdBeSzq5LzVXWNtiYnloE/8ptROGRH0+MM/8NJHZRaRUEgyPTMJD/
         MuIs10YD/0+NnDl/hb3RKqAsKDapY9hTKpn/5TyE+j18kfJODrUkaMXYvDnhRLFt+Gnp
         NB1EbubUisfre95IEiZRkPNpVshxcEJbY/xcJLV8ZVSY/I23YYPA+8paVbpjSGc5UNme
         4aWAyTbuuACXu+2PKZhBFzjn4x5UMBA+/Oc3sbJrCkhdYOUrE+SIrnUiACF3bGESap4F
         3JJg==
X-Forwarded-Encrypted: i=1; AJvYcCXoeo/U96gwKp4Dq3SUod/jZXsFk5VPj/i/g3ePVFXJr1pBZyHKUYTHF+WIYgcDjrU0V/0iLqygsM3vZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7hRQ06Eqjd9MPanLiud61Bh2w8jqNtjuYu/nwDmF+VvtyS3Gn
	KtYJ8cbxtVZ+DTPHig3kcpDMlczD4NwDgQ3mcDK7Olcl6RNKTBYPayFR
X-Gm-Gg: ASbGnct7WqVyEI/Cs6yppP75WAbZIrnxcxILhDDjZuXFPbhdRqMpEjks3z7JACC2wqI
	kYSUMgchVDSo9791O1ydRrBshE3yJrUKf/wGewtfokaJKFQt3tWRDfT4EhCFPCMJiQ/+6p1T2UU
	kajC0Njc+0YsUBqLelNZwpp4sedeAKpIzyxX8arFaXmmX8N3Q2s22L2UWRlWfufaE1G8SlZeqmF
	9OkO8N9rC6XpUYIkTXovGAwlHETJ7rbvLnxXi0xJ4KDjA0ZcuEsShduU6ln06gCB7KekLaYokpX
	Tz0lVEmDaOMQRRJ3Ky0jQtVkw5X9+1aQT0SYT+X6QJGdBH/Upt9Mj/wbO6Vkrh86cqaW3ecoGap
	M2oY4sAvGH8L3z0Tq8fTlFlJ5BrlaR773Uap4gyVIxSslR6cPlJI2HrsZuDo=
X-Google-Smtp-Source: AGHT+IGiu9l09JdJ6ZfjgQrIh+h+Pm7NXkpaxqUj8z/G296jIby1wJ/+5YRLY8gYxUFOm0nbWSBUhw==
X-Received: by 2002:a17:903:11ce:b0:269:6052:3536 with SMTP id d9443c01a7336-28e9a67bf21mr7065045ad.45.1759438465299;
        Thu, 02 Oct 2025 13:54:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1108b8sm29533565ad.26.2025.10.02.13.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 13:54:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 13:54:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: add MP2925 and MP2929 driver
Message-ID: <bd28f637-bae6-4d9e-a94a-019b4104ee09@roeck-us.net>
References: <20250928092655.1394429-1-wenswang@yeah.net>
 <20250928092845.1394718-1-wenswang@yeah.net>
 <20250928092845.1394718-2-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928092845.1394718-2-wenswang@yeah.net>

On Sun, Sep 28, 2025 at 05:28:45PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS VR mp2925 and mp2929 controller. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied to hwmon-next.

Guenter
