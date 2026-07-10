Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22173349CC2
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694219; cv=none; b=Nu+nPIpdJXEdLDV1u755XsUlKfPvwQb272Yxc+pDBgeC5IK0bKKzyEeslTfEibuRVNrRcvCHMmlPbRTKKpqTKd+szQSyExdkboc8Z8I3Ow7cDWahDAT1WKJxWFdOp/MNw6qp0DAyjtUbrkPBQwflgclopT8em2uDHFAAPOdHDz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694219; c=relaxed/simple;
	bh=N0TIROp2trl2RBha1xvvqYGNlJ8YuyPd8ww5wOB3aNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApgYO4zcoxfdNSX5q+gTGtVbIf3suKghrDoAs4ekDCSTGgjesYNpolhawoj0TiIhFaJ4e/GaK5S/4Y/msFLjJDpplGr4UdQXCGia5Uz811oHXvjyTJTXFYDVEmTI4qlKVfHRRx6qo6vRsTXD0oLfT+EYBwbMYMeLq86xiy1Y74c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrQwKkxv; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrQwKkxv"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c999f162c9aso545157a12.3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783694217; x=1784299017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6iu6OCaBtR+lMmPhSTRqqa1hHf/yoHoZhIbh3h+vUR0=;
        b=ZrQwKkxv43nH4UZT6PqdjcpcbdpQFPfiKiON1odHtHGsE+GtFo4JGtqZdYSxoz9BD6
         SUc/SqTvJjGQOlrs5/0vrPP965S5AnOt37K7nOAsVbrR+cvMN/RLeSK+1IN1w+zEWRj6
         6qdOvgaQmMd/8YIS5P62UDjdHX6IijjktC7hLVtkXrSOh0hx/oUlJneq58cpMdzHm+5n
         MQOFm8nEdIn8111Y3UcgeCa+iICCtlWOk7g7cwWzMh1YP1FgnCZEPDibRWPaAoCsjmc8
         aNx0HJWR6NXlDlk/UFlPXt6m1ek0SipzJN/MtuBOZuU55f+iX5wNsH2mwBRMjaTyM1SZ
         PjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783694217; x=1784299017;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iu6OCaBtR+lMmPhSTRqqa1hHf/yoHoZhIbh3h+vUR0=;
        b=Tl4WMd2FYKM750kyYuvbz3py5imyvAfcgxjn0YMVCH0Ve4Bi0gJgJ2eWvDR7wqGhMv
         Dl2nanQgLMC0GW26UT5anN9Xa2tUDRMiHuSMqMxOgVjskhELD9NPK9uw57ZV83Zt/m6I
         pUxJsYH6mWBANhSQVzjaYGMQMropgwPTB2N79ceTdNmXnzm0eKnv2o/U3NCxyApNCuky
         ZfoTPmSM2gEWlT3UN4L2Puzg0DMnyXA+US2tT+1HmuyPY+/lFEKRZdPbr1RGfnE1nluk
         IXYe/0pofEqiFFNzU19BK6tOX8LLydCQ3pG/u4n8kERBQgrwzgFyF/g78MwyHvJqBGa2
         wgnQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQNaW2F1/XEaha+t0HBfGTVx3KEX9x8ke4Ex8K6RMnKjT0A1A9+ESnT/6RHlCG1XYeJs4KiaNM8Brzpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlWDViqrSsSrl2vE4f6niLSnsfie8nam/YwpxNERPiUkjz/CEm
	z5llk/VmQZGGI+VedGqMNgbPHWdVYJYGWKanRyezn8dL2b15Z3Qd3cNS
X-Gm-Gg: AfdE7cnNgi3ZUtyOosCLym5ndOX31i3hdiiBk79ajHbbUgeCFicP0C6JDMC4m1UwwlV
	n49HEmqr9KNXhIVqckCPca8vCmWSXRzNel2qKSBoXeHio6bONDGRDI3UeL6mAMxtxJBOtcqxoJy
	PCiB7ZKOBwgYL9V1m9dEPVbrwrLq77olb0clyAljIULqQa3CD6xb0QZVWY9xr626xm0oucrXfPR
	l5QI4kMJv6mxY189xFp41Ob/XwkKvGs0PrX7qwJjQt9lTbbNkKGZDLPgTbcrYxlCW7fJsi5lS46
	Ks1eFiMWFx59MAleZfM9GWTGNEZCH7jQ+a1iAC+Ysh3BqO4c+0Ona7oytqYgphq6E0fN11Nb7bp
	2wFG5fNE25gv7RQOIOQift0WrT8J2K+qnIePDBSJRpiHU7WxlDHj3MmYjecBZa4yGua3HOZpLBi
	wJXlZHhzmyuQTvwT0XYTGC2Xaj9Q==
X-Received: by 2002:a05:6a20:cd95:b0:3b2:a8cd:ef4e with SMTP id adf61e73a8af0-3c0bc9da64amr14293496637.28.1783694217401;
        Fri, 10 Jul 2026 07:36:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c76dsm41782795c88.3.2026.07.10.07.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 07:36:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Jul 2026 07:36:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus-ec-sensors) add ROG STRIX X870E-E
 GAMING WIFI7 R2
Message-ID: <8d0a9350-ff37-4acf-88e5-7b4dfaad17d8@roeck-us.net>
References: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
 <20260709204037.1998433-3-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709204037.1998433-3-eugene.shalygin@gmail.com>

On Thu, Jul 09, 2026 at 10:38:35PM +0200, Eugene Shalygin wrote:
> From: Vishaal Saraiya <vishaal.saraiya@gmail.com>
> 
> The board sensors is a copy of ROG STRIX X870E-E GAMING WIFI7, thus we
> simply reuse its board_info struct.
> 
> Signed-off-by: Vishaal Saraiya <vishaal.saraiya@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
