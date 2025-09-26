Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DA9187554
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Sep 2025 01:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758849705; cv=none; b=TYnjGUlIWopl4+aTCoeMGPXydSni4yyrcw+lgCaw5CNuynnQiwyFq3C1SASL/6sd5JygO3nqE8GowKPUYG8i2NK7cL1tVDJb70wQ62Macw8hR14m+fNBOSQYGrIkfdJnlXkmJ1RIiIgEkMekUp9JPX/yV0UEh86mJd4D5zI1GdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758849705; c=relaxed/simple;
	bh=Qf7Aixfg+ZsH4rCpuTDs20y0ntBGG8SleC6ZBW3wAKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvA49D+lV5Dc09ay5QCpOK7kkY6p0EPyJrjctL66fsbUy2SWAfNhKdmj+usbaEa/xUjz4WV+g+X4Ez3LzUDDc9USvvKTRgAJcQmWjO+2NfUSD0twe0m8ivLEjuXtgEc7L3aUiJVLHLU4uJRu3CU0MgQNky1L7E2BxkjBtqji9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtQmfJNp; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtQmfJNp"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-781060b3ab6so803874b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 18:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758849704; x=1759454504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AP6fJWx+DDl8KhZETli23Qj60jKeOdbMieamHjTLXYo=;
        b=TtQmfJNpa0fh2qm1v7ZTXZ6SkpX3iMslISkjYVr4FdVyVlJObRcRJQWnJYgM8lA+P9
         DUDpE8lQbFmJWayUM8zkoFFZwOekDUwi8ZipTmI9SzM7O54qV9NCGgP12gJ08M1I4hBz
         MiOCgYo2dDzuMWkesKJv7j7nMs/eq/Q7KdPkAYtBZM9H/OjTrNHWF+9jKtJQF6eJojEw
         UVSXZrJvqeBYaCOYVTKrweb5xnUHWaNcdp+5CNFZw/Bc4qDuFwZVQTHxhhPbtsM1uIem
         VQYMXC8bsTHc3J+rjkkwrrHE17eJ4lwuCS3MoyGT0RkTympcEPmjHiBQT35O3w+etVW/
         0lNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758849704; x=1759454504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AP6fJWx+DDl8KhZETli23Qj60jKeOdbMieamHjTLXYo=;
        b=Nrez9J3bQNlc/HWt5VtJ9PqA4YQK8bu745UgVOviZTFjqZhJ6yxfIfkS52twfYJftG
         cB4zXbgB3F/YX8+p8Jojbs42HdOPEzwLrJ98wDn7+fFF6J7iOQVA/E/orWxmnTBCnUeC
         aGmYU1hCGuyNvkpIPURB5VSIVdjQvL/LCoNQllZsIAtb1c+D/sVtYvWvp6pIyagufrVs
         /DtVqe4mt/cwFS6haLd7XjelUTFG//tey5F9ZBMvv1g0gcLWoshZqWGSTBFKvcm0mISl
         yivXM3RVg9rSU90Nf7ljkxNJRjOeewoOAPZIbrOU0aKiigwV+h3cET2/0uPZBUIhyynf
         O0ew==
X-Forwarded-Encrypted: i=1; AJvYcCWCCkpE11la3PT3JqM09b0qWAEi4+5fydDDn9iHah6oyhKsFWw/oAttdps7juoohKaGXU1AKJz/MtUlBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt2eDYZr7GyB3cVrYy/xuJrv4cX9CBz6Jg5qPFNjEWf7RVF03M
	h0Rs1dwCgV3KxAZ1QW3wWmeC5hBnLNL/GK/ivjlvt1RpMxYIaOGgqXgh
X-Gm-Gg: ASbGncsw3QoQbxBi2Z25m04qzZGW65XUR10XkxTMmsLyt2wj7Lb0ei5+NnplreiDGzQ
	p8wdiasxV4DgMlfpa59dYjKmHW0WyM5afCNCzVqOeC9C465nRcXQGsWhg/ltk8WTelXYP3N7FJn
	WWQXbL+922P6KOv6nDfNF3dFD3m99RZtCnG2iqUKItn/wMjusIHYZnlUrt96/Rm3pPo2yGjgEV9
	LGzDCRZZN+4wfSWCCboRvT5NbS05w/craaKkanyoTyy+U0x5dpkguwIFwh2kqL2QBFJDctvlhoZ
	ZBsruETjwQ5JT9MS5klSw+BwjvrQ1oKCpK1AbaTypJ78lMQMtLN6AH0m1zEC5vncVjJWKbABXCJ
	T4hW5TkUp7ZRhJzfSdem2eaDJ+jXfu6MDC8U=
X-Google-Smtp-Source: AGHT+IH7AU9odF5p04RR7XTxrYV8lFhFoYCRERAsrchheebfwRcifSg/WunbI2lPkJCi9K5QgUVHCw==
X-Received: by 2002:a05:6a20:a122:b0:248:86a1:a242 with SMTP id adf61e73a8af0-2e9a0b9b2e5mr5509072637.4.1758849703636;
        Thu, 25 Sep 2025 18:21:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b5dfd6sm3112336b3a.68.2025.09.25.18.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 18:21:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 25 Sep 2025 18:21:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: (lm75) allow interrupt for
 ti,tmp75
Message-ID: <e6143356-3de1-4be1-a9c1-6a250a5e9390@roeck-us.net>
References: <20250925192219.303825-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925192219.303825-1-Frank.Li@nxp.com>

On Thu, Sep 25, 2025 at 03:22:19PM -0400, Frank Li wrote:
> Allow interrupt for ti,tmp75 because chip has open drain ALERT signal.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Guenter
