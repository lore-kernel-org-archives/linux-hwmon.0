Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB0F3101D5
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725424; cv=none; b=Kz37xdvvrK7TwqwJzFFH71C77kkjNBW3YptmRKmBzxf0tpDIXzUXu+7IAl4NwsqJqpIAvjCkIvQj1Z7QK0Uk7F3ErcABrvEFTLSUjJsikoYrzWkY/UsytcEiRlwR1860vGrF4zNMGyquU/iP4E1oMM3XGUCzCchKmV3jJuwA3Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725424; c=relaxed/simple;
	bh=BviqeMCj6xbZG75A9MR/UccuPgQG4y3Yp4Fdc2CDqkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nuRFh0QSIIjSz1YcVlKXOarCm13HPFYDmcZR07yW/+KZrERtZ1TLai+j19EtnF41kufTseDmunBOnRsLlzui/C80Pb2Wz5S97mtboYzEjxD5fQym3u4jpzQoH9OSFcQWgV7TLpTPsUsxzjLU4A0k1QJRfGewrts20VeEZFFo7EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBSRMagp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBSRMagp"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26c209802c0so52871365ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725422; x=1759330222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zs6XTUkXRg23M8XSxTfnEtSzvo14dogaq4qf3KBzUtI=;
        b=iBSRMagpnwwVM/fp51aan1J1lxdIc8wj+QbY3EHsTE9RZse72h1yjlsgHrSJAyfiD3
         09A/HNdWCdEZPnwd+ost06FXF0/574d4EzZzW+0O9tTGq/OUTesvckc4E8OlQvTdJX38
         dcn5FXxaf0thht5nWrBiMzY+uE97QmsSyOHWMP1QvJy1IoTmKZNXaSIEqEzy86cAA/QN
         3LhlOeGCJOAEQokL/9EuK1h7OhTd220WwQYCPPeybxtMDFPm7h5YZ5WTWMVdOQECdwMn
         eBTvQW2jZVXn4/DsRqO1SMfXLVjEZ1jL6cxSNvxujCc2T48YOkTVHloXAvgnp7Wp1o+/
         hFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725422; x=1759330222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs6XTUkXRg23M8XSxTfnEtSzvo14dogaq4qf3KBzUtI=;
        b=H+zKegHABcq15RY9VlDeQdd7XLEjJGRhKrTiTz72zEpIpVJbdYO/Rx37gbf2nVo94Y
         PWHXtMjNxKbHYFMAM0SnBj0TFdLGmcnf+RDmQ3lokdRfdAruG7WP1wh4cIKmMoN8CD4O
         x2zmt/o5VVLnJyg9PfwIo2zgCuJfPVnZE2pjaskPmxFrHcZXBXZ6fPOe2tsWvmR0Fq22
         36HLdg+WrYTt3z3WOzsEda4t1PHSdLD1rAYvVlhEFwVJH0vzUSNIoWH9wPAjKVgtRGxX
         yD3INxpiW5ytkOlNEQerMz+uorOGBNX/80vtVbjQvzJG/pB+mZOGDn/wJH/wDKgoQD+A
         RHWA==
X-Forwarded-Encrypted: i=1; AJvYcCXEqgIaptpO6ru/oLMf76ctQlzYaUgXDwaWfn/3liB3eX3dldZbLbPVm0eUYSXxA/L2fChGdvHljIudow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxnGYkofLZgFSXG2HwjlrgYs52PNA077uyhL2ieiYW4+GsWRHG
	arFKIeD0QpGJsbj1WwZQnbnF5g2RsUtDxeGhXvv7VjJH8g3aY/zB9SmM
X-Gm-Gg: ASbGncvDYYKn2ltx9dMoXUV9onqdRgPDkFceuZongwSh+ezNzXu9Dug/sdXCtbFTkzh
	dRzko9MDZiaGAAwc4oyRI4pXuxnhN1KcV2oZfZ89Rz7PfUNA67Xb85dJsd/LNlPVWjSR5LBvV5o
	Zhe1cZu3UjR7qZJoeaB7FIQaeE5WHGCLq9CpqwQo5lVu715IBA2Nv0Z9EbY7PEjupD2KAJX8Poy
	aswAXBRQoz56pqyvGEpTyIk9ftsFebj+UFcaqTWxYW4dwrq+tWMs9a1eRekkQHnreHQ6jsopBXk
	mAk7Xqd5yEEnjXx2uTV/ik4JEkcpRUuibHOAf4aBT45iR3Qse9TU8EhV0CrAMWI/r2RD83eOvM2
	5LNIq4sF/ekj5umEJ/JLnmOqAfBgbkv/O2iQ=
X-Google-Smtp-Source: AGHT+IFEVnMa+0Q7jFaXrSZSYdDF4WKGGwUE7RTEdlQrcVFTWGs7m29QTuWyQ8Z3+X+c9JfrngtzKQ==
X-Received: by 2002:a17:903:8c6:b0:25c:ae94:f49e with SMTP id d9443c01a7336-27cc5bf416cmr79852045ad.37.1758725422109;
        Wed, 24 Sep 2025 07:50:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26b59d6538bsm158340465ad.82.2025.09.24.07.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:50:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:50:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] hwmon: (dell-smm) Add support for automatic fan mode
Message-ID: <fe494bc6-1e4e-4a81-8a6a-c6fb95160a65@roeck-us.net>
References: <20250917181036.10972-1-W_Armin@gmx.de>
 <20250917181036.10972-4-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917181036.10972-4-W_Armin@gmx.de>

On Wed, Sep 17, 2025 at 08:10:35PM +0200, Armin Wolf wrote:
> Many machines treat fan state 3 as some sort of automatic mode,
> which is superior to the separate SMM calls for switching to
> automatic fan mode for two reasons:
> 
> - the fan control mode can be controlled for each fan separately
> - the current fan control mode can be retrieved from the BIOS
> 
> On some machines however, this special fan state does not exist.
> Fan state 3 acts like a regular fan state on such machines or
> does not exist at all. Such machines usually use separate SMM calls
> for enabling/disabling automatic fan control.
> 
> Add support for it. If the machine supports separate SMM calls
> for changing the fan control mode, then the other interface is
> ignored.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Guenter
