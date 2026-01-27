Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EE41A262A
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 00:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473434; cv=none; b=UYtjB6szFM8+mxJEp9ihU7WW7jZv1i7L2MPGQBqRpPhpFzOoGqlYRZvDs7iGFLtkvkgwZeAKD5LxBMPn3oEnRhCrZv5AY4OXqS3sa73DbFXcXhwZhWFAAxxW3mlTUtaDZaa4rvXuVs6AV5KX5jMiexOwuRhohXdHQEcnQElxaJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473434; c=relaxed/simple;
	bh=bVmYZCvIg0fuqjElUFCUghFOqlB1ruVviQKp1Q1sy0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2bzqljr1QBRLvDW8JyEHGZAC+lYkZ+biiPFJtt4VZPCx4C/3kM/QE2MtMKPG9DclAFdKnJhzl4ENA0k6uo8MeQNxmiQl65fh+aN1cbO0jiYiNSyVRBzMfOHosqtv7IaQ4hXRCkfc9FJPjePYmFWS7kVGhlqAvayby1n/WYTBvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbjDnGf5; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbjDnGf5"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-81db1530173so2614907b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 16:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769473432; x=1770078232; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=caooTO+7nQeQ+uubG6MbzWHbwrWNJFEfGvuRG7PXupY=;
        b=lbjDnGf5g32V0Cc2i/EDWdlx8S0Qke/6v6VHJaZcW0YOzanGHdm13DznBQSih6H2wT
         MlgK5Ul2qUpOcBqYlEQH3mE559TRabEmMxw6JLGz1RkCiCt9AMPHEE5KFkOgD5nkrHM2
         F/qiPv+6G1S9DBTrY7pXaqOl3F6WpRpRrLkXp/8w+HecOcaImPkn3RNm4E/TfAktnLAC
         BRhBAV3+bQ4gdvbo4vaUPy3PCPbb6YaS/BoowajSMoo4hmmhI6g2NkEPw00/zUDpZ8id
         k+smLnx/+agkhu/JSYOoE5KhJtfuoHsWY+Ca++5FncWiSDCDO4QmaGUiRCy9GzotX7L9
         ZzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769473432; x=1770078232;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caooTO+7nQeQ+uubG6MbzWHbwrWNJFEfGvuRG7PXupY=;
        b=XzrptESEzlu5XKhT/OQHp5amaYDc2v3f0VCyKgBnLONFg1Rtt42hghAXBH6bx7leNV
         YOLNBEKRD3y3lXDjnqPcW4iViHMVcN2c2OXDq4ofTRUOCuUHJ/XitwWUhCPmKb7NqthI
         ZRW1NrWeFj0KrYOQzCrWOkDsIYSvbg86HcIqLmgzeke6I3LksqgYCvhQBQbuLOj6lDFq
         glc+56rvM3Rp1Z08/BDTR69i6uUuvi132vkO5L8NBtToFRib16/39hJ9x+kpX4dP/xWC
         AzE8kjh91zPf+jRbWdPW2eJU050qRGJfCFlNs/XmRk38ot50SLnBX9q3vnfA0D2Xfzuy
         zJlg==
X-Forwarded-Encrypted: i=1; AJvYcCWrpCjCEsUtGDBjSkbTSKvC51YPbgPq+ORiGDeJlrFFJNjvewvr1yclDLk29sVMJd/JC+PnuxANk1miyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUwR0tpDy8tvACcPyRp5ShBmX6T/ehU/X1QDDHHmuutZmtJWwv
	XHuyrgPlxR19527Erq7fGMQrkZfUmpChxeEnJG0zP6zL8T4zdiKPh3aI
X-Gm-Gg: AZuq6aJ/K0aA61uF28iKNUXgCJbqAQkkzYj43EcqJW6mPJ+EWsX959nAOikHPTQrUT9
	EXvO8ljf+j8jl/k/IOloD55cqed6KBAVYZU0ai123uiDlI8xUX2PbBlpFEU2hlyzjm3M8/CAClK
	hcpRgUKf/w1IwiLYGehHAmn3QLL+3QVmkZEzMmVzDRoZWLoRuEgnz79hJVWnxs2lp/Mr0IGO8bE
	HJ2qDboH3aWRShnEMRxQCrFcv+MOg9LWW4A0LtwIz4S7IpwJzQcrSXz2buJ6TRcHmCdZNIqp/lw
	TM30T+nUiKCWLs1YUjconaHFIjjQLF/vDIPTJujcViBuCQqSzDdoNbOQXEue5dV7nfOs96s9fHf
	TP51WeZCZ7sfAvKeqbmdAhRXvHflx3oq7asYZ4n25vCzzc4xJNMSWZb513+BC8QzTdO42rMiM6J
	a4VLbyUg/QYiecRPdjHcsIwSfl
X-Received: by 2002:a05:6a00:90a2:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-8236916ac21mr31129b3a.14.1769473432307;
        Mon, 26 Jan 2026 16:23:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318644bcasm10315629b3a.2.2026.01.26.16.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:23:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:23:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: (cros_ec) Split up supported features in
 the documentation
Message-ID: <6741ce04-c51d-4c21-84f4-c7f26b298b44@roeck-us.net>
References: <20260118-cros_ec-hwmon-pwm-v2-0-77eb1709b031@weissschuh.net>
 <20260118-cros_ec-hwmon-pwm-v2-1-77eb1709b031@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-cros_ec-hwmon-pwm-v2-1-77eb1709b031@weissschuh.net>

On Sun, Jan 18, 2026 at 10:45:55AM +0100, Thomas Weiﬂschuh wrote:
> The wall of text of supported features is hard to read and messy to
> extend. Split it into a definition list with an explanations for each
> supported feature.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
