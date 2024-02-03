Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF995DF18
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Feb 2024 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706969779; cv=none; b=ciPaZgeEr094CimeJRbQvLWsP2nGSjhrDAK/VnAkKJVpbwteGwrcSICqd5oR6/DqfEAKntaq4p5NAseC0buJfZxdU0sXO7jRqv9gcsKiTWI6Y4tpCx0H0yr0cD9QS9t7SWy+8gGdpAoWCUGVxrIIYQsthBcpI1d1YAYWlX4Fo5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706969779; c=relaxed/simple;
	bh=qtIn86P5MJ+PDEQkh/mo3yKL9tts2jV8onhYq0bu+BM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=CVIEhbhldmy/PE6HyA9t4+LEd7RlQecu12kX/PyBI4MzA7ax7kWVz8KuSG3dhBgvFBKCKBmCZGnoeJ2LZ0Vfz0y6HxZoD3c/iC20WPplOzWYpij4bqG8HkEgbbzhRcjlCB4r0/e2VS43S/LQx2Ur4Hp2SPBq309zSm0I1pavmR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=XPpD5bDo; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="XPpD5bDo"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-511413e52d4so887122e87.1
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Feb 2024 06:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706969775; x=1707574575; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qtIn86P5MJ+PDEQkh/mo3yKL9tts2jV8onhYq0bu+BM=;
        b=XPpD5bDom4F98EFUvKh/Ask7ZO637qsSyCExRUHDeyWLCC/g47+K8hoa59gTDVqOmY
         YiFx4nJ4RqemUwVxhjmbFh4jfAy4RG+jgIEvhUx84etiI1AgoktSeoaiOzCehKd2nVn5
         ShpvJ3L6exGQbYYDF9I03F2buO3bODaNUiB3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706969775; x=1707574575;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtIn86P5MJ+PDEQkh/mo3yKL9tts2jV8onhYq0bu+BM=;
        b=KGe4H9MZdXQZ/R1cLWcQ8KaBTbievMu9Hsj2WBzJuaLh5tugBKdZDPqLFL7wLMJZb6
         G3+t2QVuHw769xoJpj3NJS0fcG6fzJvwthpB/7ESGoJecP/dH43JuSrmI39zDwVWczjd
         RMwtzPmBFa5laWUgjgdrJOppKZGUEN/FNsQSiL36SGDQV+MuZKA9HTlx9XplJ+DGbnFE
         EqpQiCrk7cO/pGtcXJr63TFjhPpZqg3wmUOE/Gxml0hUPNZv5x5n8MSiYOX/cZvAOYUT
         6UaqclJTei2V1L1VD3OUi3NzCFfqtvJl7bf3zHoX40OmM7YgqwoHBqZ1t7800VheVC1a
         b2aA==
X-Gm-Message-State: AOJu0Yy3rRAYf5ehOXdjH2GFV09l09zI6t63dT2zMe4N9FTcbUGiTCIW
	g4IXV9oFuJJ4H0hFGLllgJu0Kvr//1na8nHTUVsC7wrpE7gTQZDZq4TaxO+JgdZR7awq2NfGT1A
	X
X-Google-Smtp-Source: AGHT+IFyHx75uSWDKY4HNMMTWsfeVIFhn0vV9nBur2MZT19CLIbVwIkQBey5cX7kuTpVXL8wcBxCbA==
X-Received: by 2002:a05:6512:10d2:b0:50e:d5df:c61c with SMTP id k18-20020a05651210d200b0050ed5dfc61cmr6482224lfg.44.1706969774827;
        Sat, 03 Feb 2024 06:16:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV0arKeN1Ac07Na4W9l91ewA88ZEXTkfJ5+0tp/G/eDqrgcBm1iETpyUUakbS9NHKYNAdrkEpWI6gp0BHroTiYRl9T3XIxUhUAQkGNjPRkkbQixY0sKXPvrhyGbvDyVNGpl31xoBVDxWNmQcylA8fnqjv3W8gZTxUTiPkVFJrl/iF/lH4DZVsNi6wug6Yk5+Jc8HsxFvDJ9JmY580JsF22nUFyh/NY=
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id s24-20020a056512215800b00511312d9d49sm626605lfr.234.2024.02.03.06.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 06:16:14 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: linux@roeck-us.net
Cc: W_Armin@gmx.de,
	ivor@iwanders.net,
	linux-hwmon@vger.kernel.org,
	lkp@intel.com,
	luzmaximilian@gmail.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [groeck-staging:hwmon-next 13/34] drivers/hwmon/surface_fan.c:22:9: warning: no previous prototype for 'surface_fan_hwmon_is_visible'
Date: Sat,  3 Feb 2024 09:16:10 -0500
Message-Id: <20240203141610.5838-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <ffd297c3-4ac7-45e5-bf76-8f4e4e9e603c@roeck-us.net>
References: <ffd297c3-4ac7-45e5-bf76-8f4e4e9e603c@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Yes, I already fixed this up.

Appreciate the confirmation, thank you for fixing this.

~Ivor
