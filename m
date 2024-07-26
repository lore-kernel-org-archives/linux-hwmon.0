Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA13817B511
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722000338; cv=none; b=hU8ORo8Duct0XwpOBOYB6F7EOSpsQOFJ3NLTvMVWxSGm3Lya3tOr+Hbo2P/d7QgdlSt92E2Ndj01sKN/QJBGfh/xkC9yIALXRJ6gqsAYYKOFoTpH9TEa7S4RU52ZQ6adKtBU1RdCK5Zmi3IkxCUEAbIiab96sFcffoy+wHoKhC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722000338; c=relaxed/simple;
	bh=yz/OkhwTOn628XyBKBjEmwFgoXb8dhvpzgqFjeb24v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3A46R0DvMYChFYszVe/Y3VSvZbh/cuPc5ToFm4xHp7EzGyeHNZdUH6QWRwLG0RgMsVB7eBlkjucdDGFup025D6wzY7/MjhDplROpS+XTDprunFG+lU8rYmO8jyUt6PxxoS5hdycBF7w/5Nk2cm+BUoItJuHe6xdo/pwlp4FnmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIiWADAL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIiWADAL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fc4fcbb131so6264295ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 06:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722000336; x=1722605136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1mfPn3I1bHlyClQ+bLlYz2pTSjJFgOiVNMbhqwGfs0=;
        b=nIiWADALPq/6OXGqO7cAoOoNVdnodLycUEFDEXRzfONMz7NmU2wNZRoVT6D/SgIh6w
         w4sFJDxanEdTgrWFW4DRERGJH+65H68ylKJt3GONgZnHb7h9+n6ApNvhz5lO3URNAp2K
         41XVsbmaETUlwi9J6TKryJJQYgAEdHe9hm/LAAEdWTzfqM7VxXpl0nyWMX222mUy8Fj4
         X6FLpuYo1mPO4lILHRWgX0vdQX1a4p7Dw1MmZSFeOQFeUE3VBWRYjdwaGpfbW0w+fgUE
         GhSDSYI4KJCwbQ3xoDbGaMj8PR7IcQFqu/mMilXhkv0lUAHHVoQ8q3sBaUyZcKJM06LY
         u/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722000336; x=1722605136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1mfPn3I1bHlyClQ+bLlYz2pTSjJFgOiVNMbhqwGfs0=;
        b=J1Pnnbx66InZM+NuC2Z3LLRCuiF+OD0XVaNVZ9r5wWsOG7T84P9Fj1pUAyEXUP4Gzt
         mCkjL5alYlomqFUurCIG664nDlLcnbB/ArfpNBvwNZ+VrO9dz83XkO5WSF3fWXCVDmBw
         bTtzLhDCsKpt2K5Lwl6CjGZQ1bRUK5kfyUYyJhqGnztYYRQjczeYNc22XDNtE+qevQDm
         g17TkhvuN44jMaLZDiuYYld+agAdfBG5cnfGrXKLHUGjbUORby1p+0QzL9/McheLeHeM
         5kFv+xX4M67lXqQSVtcEqb/EC4ph3aHH6y+nb1H+nCuCSCDu38xfO3nIkKIESKagdS4J
         cxHg==
X-Gm-Message-State: AOJu0Yyy/DwtI9hbjnbedpNhpYb/SHmE/xnNDr4fK1xgXdEQMQzSOlup
	hCsyVshX4LgMB3rZ+T5nd++FW9LweBZPDZf5yNftU6T6xQr9sGojK+A4Ng==
X-Google-Smtp-Source: AGHT+IFsR68DS4O0k0pnOGW0HbkorAcj3y36OwhCiYWGiEmC6V+pW4ZLB1f/7lCqdG9GZcDP1rNr7Q==
X-Received: by 2002:a17:903:2d1:b0:1fb:8864:e20 with SMTP id d9443c01a7336-1fed927ad5amr55723625ad.23.1722000335986;
        Fri, 26 Jul 2024 06:25:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee4d26sm32134755ad.166.2024.07.26.06.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 06:25:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 26 Jul 2024 06:25:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: ltc2947: move to firmware agnostic API
Message-ID: <11749b76-4ca4-4578-8551-4d5fb5a625cc@roeck-us.net>
References: <20240726-dev-hwmon-ltc6947-fw-agnostic-v1-1-f7d6cab7d438@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726-dev-hwmon-ltc6947-fw-agnostic-v1-1-f7d6cab7d438@analog.com>

On Fri, Jul 26, 2024 at 02:07:33PM +0200, Nuno Sa via B4 Relay wrote:
> From: Nuno Sa <nuno.sa@analog.com>
> 
> Use the device property APIs so the driver does not depend on OF to
> work.
> 
> While at it, properly include mod_devicetable for struct of_device_id
> and fix some parameter alignment in the changed places.
> 
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
