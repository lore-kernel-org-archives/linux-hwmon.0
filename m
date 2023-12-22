Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B47A381CB
	for <linux-hwmon@vger.kernel.org>; Fri, 22 Dec 2023 23:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="chNSw9k3"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7811d1e68b0so159117985a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 22 Dec 2023 15:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1703287029; x=1703891829; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7CpW3HQ3edIB3pC1X9J+ZszFBlQ3pCTa21G/iZStcgk=;
        b=chNSw9k3tyBBgPYw368jZIK4B/DunMkafbHBcScFFElE9LbZVaHnoY6/WC1411wKc1
         qKENLCvlnT6EwlBVRhes/VZczfvM++sNQqp4b3Bzi/Y7+XVEEPBdcLOqaN0RqovkQQtC
         iniERB8qCeQ3xG+6mVjD2hF/2CE5XWsSPWA0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703287029; x=1703891829;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7CpW3HQ3edIB3pC1X9J+ZszFBlQ3pCTa21G/iZStcgk=;
        b=tUHcCxI11qL45Kyo1dLFW/2lhGhmBkkpinJnQN+3K48QexFCbLSXQfKAtvf7fgbbbs
         CrFtKoo4k59UXzXPmQMVbsUZRoitP81BtPRwmzKlXMK0O589+IVMSXH8aKmuGkRNfAjp
         bjvPnZUfjY0kZeC+Ba5d1/YXSlloCtTMkhMrm2RnoIsBRoAi6FLYaUWGOsTr5Qod+Fa1
         2si4nNwIKpSxFcsQ+YwXFFOzcnBiBUrFZMXyiZZyFocgY/H+rlWhnKIg8EDTPDxdVHx8
         qvPpxpcxaMq6kPtd2yPtwTmgBo8wDJipjWEP9Qh+czpwIvC4+/pkKFAFjFiXiZ27MTSX
         q3jw==
X-Gm-Message-State: AOJu0Yy7wYiFh8JjS3crNP5IwZ2TloUbX52ZKwmXoUXJCL9NbC7QsngN
	TZ+5PLuZD9KJdwN/NnzWeqBEgus07YB3FNhLJnlX7XqZhQ4ugg==
X-Google-Smtp-Source: AGHT+IHS2SZicxvBAydDZ0dczVgPVcMjllDPAaqVKpGvtypPcvbU5dRrD+q0Cevn+jgytzUmjAUkXw==
X-Received: by 2002:ad4:5dc6:0:b0:67f:43ef:c8df with SMTP id m6-20020ad45dc6000000b0067f43efc8dfmr2476193qvh.98.1703287029358;
        Fri, 22 Dec 2023 15:17:09 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id gc7-20020a05622a59c700b004260c76e4eesm2221739qtb.27.2023.12.22.15.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 15:17:08 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: linux@roeck-us.net
Cc: corbet@lwn.net,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luzmaximilian@gmail.com
Subject: Re: [PATCH 0/1] clarify intent of fan min and max attributes
Date: Fri, 22 Dec 2023 18:17:05 -0500
Message-Id: <20231222231705.4338-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <ce60c838-0fad-4bb4-8af4-a94d43092d4d@roeck-us.net>
References: <ce60c838-0fad-4bb4-8af4-a94d43092d4d@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> I do not see the point of clarifying this for individual attributes,
> especially since that might create the impression that it would possibly
> not apply to other attributes (for those not reading the above
> documentation).

Okay, fair point, I can see that lead to more confusion indeed.

~Ivor
