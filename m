Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC72279792
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 04:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775018141; cv=none; b=b9lCUUVS+dO//veKAPBp2NmkU7i+YB7MMRyunMy2knj7OdDMi4W2hiUe6zMNeTxdGHbW3dDrPmh+rGSS7GtiZtRA2xxoI4sFyQabtXATgDYZZvbiSXaGYgP65lFFntzwdYyuhrqfo6NEb1iqJZXYKsrrCcv74waw/jzQGPa2pmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775018141; c=relaxed/simple;
	bh=6TEWq6Ee7ibJwmAKLNV2B1+LwmvrhHlTcDF9+ubKDDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bK8gQ+rZn17fRU+kBcWn+kp7J4HB6vSASLuhZXvPD/zd/k1mJGCl+/Id3fU3RwtlemewacevJbAvicPk8b1CTbuUznIqoFREE3JMLBOmqiis1nt1jyxV/azxDI0C8PGv5kzSvvRRdAiwo5du1s+IsuYDSKwRz4lhpe1YJfvNdlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKzt5lGG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKzt5lGG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ab46931cf1so3632515ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 21:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775018140; x=1775622940; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ec8rBc4bHXuECiBapwwPnS4XkgbNoOA6T2HOdti7d8M=;
        b=SKzt5lGGNDSRw8ODBcjcBfQJyAFu2oPEMI4MWI2CNTkOZqpI7HhMKWl3k+Ln1RFWDJ
         X8rRiLCEs8S654swYWCK5QYbMAcqwCmgmGVMJIxz6eJNul6wT2t1VUfWI0MP4KJR9Wv5
         P03k/ogEWFx5EqIEWed5mwPo4ohC6VNmCFuWahuCLciU+sH7K2INiwHpmsb7c2rTvk8C
         8vVvXVTcXZsN7DbTHqZUQTTTnYIjWVxqoR1mz7Cx7nPGlFLULd40EJHQGKXXWyNJT8NO
         qLTPmfgSsN7ZTpIGIiQsmNMSMhAn6UO1tHF8VakXpRo8e3Dw9ZJZ/VQNMtbF9gGNjV8f
         cA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775018140; x=1775622940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ec8rBc4bHXuECiBapwwPnS4XkgbNoOA6T2HOdti7d8M=;
        b=atv/jMMF82gMVlOi7pXAPG7Pz8oUGzDCpsUPCI7Tpz5vMsFULaHkLSt02WlgScKnx2
         WkGG0u4tt1c0gZrxZ9+9AMI5YKd5dlVHzXAnd1PHx4RkA7A3wslfEw6wZCwUN+dUZcfI
         xF884I6JFqZFMpl+KDrzEKMMD4I4X2HQdiEOkfE7SOsgjmaIADzrxjhXGnbdh39ZhO54
         GX1ksEiEOadbZAja4/9AdHKKgJWM1gp43ANxbsqqkxIZ/vya0s1Dyw8PPhWT07kT44HK
         9j8da6BbkLOyf27/HnDiQ5gGnNmbmEPYfu+kWCG2KzC7Vbwg+5H5Tj+Fi2H6GT8bCwR5
         xeXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrLJYZURRt+IRByzv4j7t81cjAo+abGcN9oiR22VZafbB50Jl0WHBcdYIfgcIa2wq0tHPtDJudp6Fo0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEfJhNYAtR0pshtkty9pFWZLyi9b/Rhlnc2t4R1op8u2APJib0
	VQYO8yBmcCaD9DLjFNtQ/IftZLZJ18vNivOHIk9X8JF3XSlh12DLfnVHGmDK6g==
X-Gm-Gg: ATEYQzz9DmxeygfzwL1QlpbTD6MGEgqroWWuWNE+aEqxWWdvnO1PWGzzLOV+ccvCrDn
	zJg2lpbwcxm+CgXJzSRbgQhuqZ3PSzba35FeM1RyryqZM+F7q4VTnSLFhkRCbkuVuBFW6ibv5pg
	3b7r9VfXrAcbRxq2rgtLEet0B7aczrR18/dX+oWZNR/UtjcXgpou1eebQKFG7PobpYDs2kAEaI5
	vU0C/aM8dTIkO9r1zzNb6kJQk70LSB++IvMNWlekUhu2tp0nOrQ4zwpI0J1l7iYsUy/ulehLF6f
	yb1kBld4AUnhX65Bx/oS+O9ApLIxL2jfL1dqLy3BpjDIWmXWi5w3oF13Lx0IuGI0AmWn59KDaX1
	Xq9Sq+GpFkrpb9+LE5PMPLTozXg+Tb5AHKIF4dNRNBmsNMY64Xlerzq/Dg95gpMZhm79sZrVKmz
	vlB9yrnIs6Td2kWmU7Y9Cz8TaddBCTxNcCuRDY
X-Received: by 2002:a17:902:c151:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2b26982309bmr12233605ad.14.1775018140159;
        Tue, 31 Mar 2026 21:35:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242670302sm126486225ad.26.2026.03.31.21.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 21:35:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 31 Mar 2026 21:35:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Corey Hickey <bugfood-ml@fatooh.org>
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
Message-ID: <6f1e43e0-14c0-40d7-ba43-95ece77d7176@roeck-us.net>
References: <20260331215414.368785-1-bugfood-ml@fatooh.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331215414.368785-1-bugfood-ml@fatooh.org>

On Tue, Mar 31, 2026 at 02:49:06PM -0700, Corey Hickey wrote:
> From: Corey Hickey <bugfood-c@fatooh.org>
> 
> On the Asus PRIME X670E-PRO WIFI, the driver reports a constant value of
> zero for T_Sensor. On this board, the register for T_Sensor is at a
> diferent address, as found by experimentation and confirmed by

different

No need to resend, I'll fix that up.

> comparison to an independent temperature reading.
> 
> * sensor disconnected: -62.0°C
> * ambient temperature: +22.0°C
> * held between fingers: +30.0°C
> 
> Introduce SENSOR_TEMP_T_SENSOR_ALT1 to support the PRIME X670E-PRO WIFI
> without causing a regression for other 600-series boards
> 
> Fixes: f7ac3020036b ("hwmon: (asus-ec-sensors) add ROG Crosshair X670E Gene.")
> Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>

Applied.

Thanks,
Guenter
