Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1571E9B0A
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Mar 2025 16:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740932100; cv=none; b=iPJ1TZXXBXvYgOmO+q1AjSNDl6nus4ceQGyM80iVS7B19d/t/rEjt5o7YLoIZUMZtg5vM58QifJBU9S4gVAXoSu+mOTcQA+8admiST9SLgZ5EswfRIVJ2UQO9smmnhVKQpnu+OKTfnvv5eVLfX9v8UgZKAJ7iU04TA3myWWgDsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740932100; c=relaxed/simple;
	bh=bVRzqdX10lv6/py/0AUd+d9jP2RIns/AxgJ42fxFPOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGh9Drm4XgYxvNPNmL8sdAaF0xJQhrmqWh2J9+CHasMJCUVRuWqbIRVbwv1md27D2VHpqG9S4eYMCiex4dB0S8Eun0aqLZ9PfVvmAVZStCX0ZE5M610iybNfZEiLCvvadxfnbXiN2H6fbpBt7PfCvzzQOBPZsVdx1RdKzX6V5f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRn4Ue8q; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRn4Ue8q"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223378e2b0dso51624245ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Mar 2025 08:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740932098; x=1741536898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJb55axwrdQd2n7JHZOC7qiwCga0+NFRK4WdT3RyIM4=;
        b=jRn4Ue8qDQmaSgFKtFsegu2mKYgTM4oM+QAIeLW7Fzmdj14dFyCz56lOZBnNYh5JDL
         x6G75pxVZxQbU4+f7fSD4Pkn2XSWa0UQViqEMfEFYg6sGlxNz3ydHNcgtUvEkQA+CeTP
         d5mPi5cWmVvnDpa+ftuBV9i5UJoL8kbiynwhIe6BJMn4GnyQbmJl91zR7phO0cBxu4Ig
         hUUuAwFpeiU0BFY1PaUqR2gLoQ0DEOJ9pn4FraYuLwNLvPkMRQD0d3i8qheNncmbAixY
         7qVftpGif4a3IIo9AjAgCYyzjs2sie6X1V6AtMxiJYcLCegk0b9myJ13q31WdlwSBM91
         8lTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740932098; x=1741536898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJb55axwrdQd2n7JHZOC7qiwCga0+NFRK4WdT3RyIM4=;
        b=XbT2Yjma7cmHI+517bEpZbQ6nxTJembQwTBQrfSLkfUEzNvkAkIt7rAo2734yXTN4I
         fMyerzsO04YMJDTZYN9TnG1rDcFwHzNhYEu9kYJQGjITJrejUgzVliIbPkRXbvyClGRa
         7ZecW4c6kTaGWjXY1a8AybpCNvcBFtclZMlqY138D4Qa/gTjVIxl32fxHl2TkS5Twrvm
         v7asC5Q5983ArT1r9jOgmzDGKcvhWr9O6N7ZDnDVIkdaOYMyby1sCBGhhKfR9WbXP6TC
         eu7teXZ7HMXlJnB/RalTbews4e4eOHs98Locdn+648l8HZxZVnn6CsWQfgfmREF7mdQf
         dw9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVycHVuxRtSs9yj/JeLP27nXf9JZM0ycQ8BTfnqSup7xF7feUOMF/DB7IMtKujbWCK2Qv+8Ca7obmTIYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHIX+W9OgnGSH4hETsmSX738vbUmd8vR+upsIosRzWRGUIYiVx
	btBnpQ1NRMDd1OZCp8mvwef9zdmrO8hQwoCIBxFtg5L7lY/KtSA5
X-Gm-Gg: ASbGncso+uc+2T5u685ZZzrB5FXx14b5eZfObBZoSvAqqnBO1vA9/bzpospitcFoFL2
	ovymf/KRaPmLAstec452N8BBDyHkfJGUEteMkYT5rlFLPIOJzzSUGvsC+XOdzsuISZsRuLNkQXh
	2cg9Ja9Ed6ho1zOqc7CQAiiYlZattY7pNoH0Hvzwmjlsd+HZd3iBSh0MWTHkLK4geRz9gCYz0wv
	WNRsWh1B1Y1dVu0exTWL9Fb4jM3c9s0mAY8WF28pkjXr8RfaikWScU56tVuRnAOugbFH/40xtdo
	SVXQekw/vn4EEHBfo4irZ3ka/y31FoPoRI4mtZE6z2pJmbbM5DjfX7uuCA==
X-Google-Smtp-Source: AGHT+IEfZ3zSqLZkN8LXqCRhOFpuWWLDsxn5Gqnxj8m//12JSn/bUJi3OvVoYFMfAAVMTo6vdBDMCg==
X-Received: by 2002:a05:6a21:10e:b0:1ee:c8e7:203a with SMTP id adf61e73a8af0-1f2f4e8fb25mr21621619637.40.1740932097981;
        Sun, 02 Mar 2025 08:14:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00400a0sm7333768b3a.140.2025.03.02.08.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 08:14:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 2 Mar 2025 08:14:56 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mikhail Paulyshka <me@mixaill.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Add customer ID for AMD BC-250
Message-ID: <610dd1b9-c8f1-4ded-a1bb-108121b566d3@roeck-us.net>
References: <20250302155053.50096-1-me@mixaill.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302155053.50096-1-me@mixaill.net>

On Sun, Mar 02, 2025 at 06:50:53PM +0300, Mikhail Paulyshka wrote:
> This value was found on an AMD BC-250 board with an
> NCT6686D chip.
> 
> Signed-off-by: Mikhail Paulyshka <me@mixaill.net>

Applied.

Thanks,
Guenter
