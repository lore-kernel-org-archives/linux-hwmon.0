Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC29C3BC4FD
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 16:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768495527; cv=none; b=bgFGXxsdpT7LhjNKX4BEASwzDfdjGlWS/41/J5aI5s+2Nf+DwuKUjPN4Vwwb7MBY4povi3xJdzsl/ARswycZuaR+uLeN7/P7CgGuSTJEsNv3t5AYoa8sBEFjBM4hKqyFGnlHRTHWKkF3Q/ilIaNoLsIDAsor2Ru6blfvVWdQ6/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768495527; c=relaxed/simple;
	bh=eS4QuOVr0svpwPRaCKvRb+g3sS4XSedzbC7Yj9h+n34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRg67ceLWsusBiAom/k4KoyI6iFpUrhnfmV0tw+PKCZHT3dj5E8cZK44fCTSX4W9olqlrVQQOxKHR33rmq3h0heWnVlpU7LvRZ0z2WVaqiqHZmdvZaALZUES5RSkCejTksgwO1tVd5eWP/B/2J56TRTiUUfy2bZhf05kkQf8NTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQAMwgS3; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQAMwgS3"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ac3d5ab81bso1284537eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 08:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768495525; x=1769100325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIXVO4ZwF9wv3PsOKmgOy2Rz5iSvuvGgjsJ4tTOklfw=;
        b=TQAMwgS31JA63WB5T5uIYuXPJS04qMZpIzy2QGGAAWJsY57rYPSWY4FePICyZo9Z/A
         EwbBsrHKVLAWVI9sF5sOevlk1nTFN+1ZiMscQjcusSqgqThtPRriMhK0B/xvSx3cRxyY
         w0KHVu2mnhFNZ8d+U5PL/4N5IaGm9fbP9HskgcouOsBG1C0AMgIQB0xYPcZjgUWWzQx8
         BviHxP/ds1d308zaU9mmtL1xUypbclvbr+3gr9iQqKLmvsFjBOMfhGR8zzV1JfoME3yt
         IoDnraR4vELq+SNjSvCT/0sJwDcEG3tUKRkAkr95BHg7zXmiW9lxlix+IreyoLnxJDAG
         kOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768495525; x=1769100325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CIXVO4ZwF9wv3PsOKmgOy2Rz5iSvuvGgjsJ4tTOklfw=;
        b=dcUF9KgfKuwSaufLV2Bn/pP2mzYNmyvba79Xpjq7PRrl563+SMNliq/GqLgI/OXy47
         VSOIu4L23UeOQoYkUNGQApHFDKOhSHN7lTrbNGhEyW5x9o2ywz7WXJeT6OhS5kQZIDCM
         VYjz/2PCokiLnTYSTB2F/QKrpuub918iuoZwXdjBB/P+b1eYmw+V+m1bXf3RVTVMD4bp
         1P5luN6aSps7jiJPMYP39N+ZXMnE+q7Gh89hIJmWfal67G6Og827WHneY0VveV/idbud
         K2jHYNUkfSzHM1uL0ZoMHVJIvvbc5zlRLYVqNKRgdAY9ix4GxDhtsHNsGGLQ51rByMpp
         ZDIA==
X-Forwarded-Encrypted: i=1; AJvYcCWEyIAHBGkDzG9y9nMYVHWyS4Snn2HFGQYTxflLR8ltIEIrjFZY+tuOBeh4H1guz+Cl8fk3MQ870BJ4mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrmrD1nUy66L7uyMC1KEZZymib1ygF5LjOZMsXd/svO7iYSIaa
	LvynLYAtkkQebhIq5g61NPpce5JG9nYxUK8/yqs7D63euY2EH8u40ynN
X-Gm-Gg: AY/fxX5az0aIUlhWf0NBMMaz0S5B9+30sBkXExTptWv6j++Tzt60pqvzND9sh0AqiRX
	QcCiY6ann+WO/rCFZjebMM5eWRNwanvEI26u8z2PhI+AiCT2DYLM7RCcGfBR8dAhuf3ip91qTZ7
	Gs734r3NHmHq0PUjXfeg5voXuhn7JIfaZZMOZCkGv+5sp8VEq+QVi7oZw8xLBxgg8zPUH1rnpy4
	cAjhcpgHtmpSQkXj2IE5H77SaHzA19axBsM1CFZ/AdCuqo97bRVtWkf05zFLK4oh+se037CgR0d
	YdUIMPXrT4JmwUK/cfsYiiIxXae6hQ3piUZnklAFc/qLJWAR/pZArJ1uKhlysMwfcXHj1iTX+5C
	OiYTOARJIaS5w/hz5FgyG4kNS5tmAHPw08hcqwSGm/mcpg+Qd3dT8kqJSMJ3ANMo4RsxolwhzeA
	aHN/HdT8olb9HvxWVSXlPzicr6+RJCs4emjao=
X-Received: by 2002:a05:7300:7b86:b0:2a9:9aed:bb78 with SMTP id 5a478bee46e88-2b6b3ed3bdcmr49898eec.7.1768495523343;
        Thu, 15 Jan 2026 08:45:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b352aaa8sm101875eec.15.2026.01.15.08.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 08:45:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 15 Jan 2026 08:45:21 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Felix Gu <gu_0233@qq.com>
Cc: Ban Feng <kcfeng0@nuvoton.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: emc2305: Fix a resource leak in
 emc2305_of_parse_pwm_child
Message-ID: <b0a7691a-37f9-4b11-a4b3-1cc53b351eb5@roeck-us.net>
References: <tencent_98E69D461A9CE773D3611822369100FE5A06@qq.com>
 <tencent_738BA80BBF28F3440301EEE6F9E470165105@qq.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_738BA80BBF28F3440301EEE6F9E470165105@qq.com>

On Thu, Jan 15, 2026 at 09:51:48PM +0800, Felix Gu wrote:
> When calling of_parse_phandle_with_args(), the caller is responsible
> to call of_node_put() to release the reference of device node.
> In emc2305_of_parse_pwm_child, it does not release the reference,
> causing a resource leak.
> 
> Signed-off-by: Felix Gu <gu_0233@qq.com>

Applied.

Thanks,
Guenter
