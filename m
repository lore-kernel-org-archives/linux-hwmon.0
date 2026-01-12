Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D9831DD86
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 21:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768252949; cv=none; b=QnfM91vgeSExDpi10TVu05a17DylQVOAnB9xKLSXEzlBnQL5mm1nGtmATZRF9QgxKDCn69rTzQ8H8+B3+RU2XFx3I349tEYUJ2GLdlFBSMqONVSNmdI3pHx7skkO1rx8v4GtBAnBl1MeWgaRdoWd4hnEAqKuPVTnAQSLA4UrTVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768252949; c=relaxed/simple;
	bh=Ra93EmiSB8U5CSWufHGQP+kA2jj35+udfNMcOe4uMIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGb+TFbhws1hFNC/ezoq3yc8brmQsBoQ2ZtEOcWH6MON8NUJHtMW114Nt5wu9zkqMBqJd5hvRVPGd4y6vevOpwh/+D00MjhaU9704YfNjbObvALKM+6b10KWSoQOpzhj1rzcn6z8Oz7DILyM9eMdUoM/6wNxHjFbOaxFE+QxiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghitcxGH; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghitcxGH"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so17251761eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 13:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768252947; x=1768857747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SVc25t7T3yEJ/IttgzC+ZfT4Ui6nCBU9dwi8YFRwxw=;
        b=ghitcxGH/ttZarfkc0ctA/s4QojuAdjcsFT23bBkAvRTMloBkl8ZKRbAYH7AXVHFSY
         NP1+UCFgVxeztOsZbkt6IWCDxWKl8UFeZntPM2Essii1h7GcxREnsXZDEmbvxGJlbrvV
         /IJUP/4GIXlPYrQngUMxGRQeOtubs6FKYdnIy/JUrwDrrfz19OqtPOu1tfiuTpfjOw93
         WylICcOFDC3TxiNZkIbC8E4kkZXBoGNtmyVpOVhp00QC+bhnBbCxGT6BWX9jOE34e13U
         KBhHwnn7xY+vXJCSwdu14a6Dm3W7bJBG0UMFAet1CV/Ojv8oCptQLqt36RRpcG1YS5Gr
         9mcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768252947; x=1768857747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2SVc25t7T3yEJ/IttgzC+ZfT4Ui6nCBU9dwi8YFRwxw=;
        b=bz72xoHx2ZQyJH/2w7qk3M2mDV9AF2zRPDs9zJwpzLgOLhojhMXtJPgucfbxrcL3HN
         IhvM6bqPytoo9l77H5bJTftG27/OLiH6TsesFXBIMecasFQdPwlc0lrkQLOqHnixKH69
         fE0xPKkJhiRGtiQg/BTxiZwzBiePU1KhAw+Slai+x4T3xUc4xXx8L2uQ7f7eovH346CY
         WLGma8uo0YJ3lIFuQ6yquyK+qXgJPUfXOfjsdv/WLoWv2nqLCbPoQqmxRRhFgJW+vdvp
         EZBEvkoffaJtdNr13VZTzavY74pODpluD0j4wbRB9noQXQNZTUIAYiWga2LJVdA3W23K
         Zwbg==
X-Gm-Message-State: AOJu0YyPjO9PLUCB3BTu4UORZqwBNuz7sKLPW7O8a8w3oN531M/ukdLp
	MLGG0KNZvBxxzN3PvkVbTS1LD8FoFzNi3BAWNukM9JqZ20MUQX1QGgLf
X-Gm-Gg: AY/fxX6gtk0QlITjA9FYLKTzIVh0ygevpSrTfbA55mEXWyLT7XhcJnGhnlqrtj8DR9p
	AYe41X2spX6lmn7ANTZl9y6NwuU/YPyYAP8RAwb9C057N0wVeeIDCEs6nnAeGQvwZ3rcPgF4c69
	kfDZ8TbWSY1xMEEGTYI8FkfmaZF+tZm4nqtH8Q9bIjcFtWODKeX/DKmgtglRCwI4UkdxlEoqiPl
	s3RlUOhANMp0SH5ap5OP7C0qa0I9xjU0hisQyNk0ZhysR+nqRqQn3MM5B6hfzcUM+zIGDyDgo5x
	9J6uQqxkUBjRHdme/FSfslvNbA4J89gYZx+AO5e7hK6X5N+wjnjOjIhHyBYlEJACnCgf3J76Ixu
	daWigP57o+GPL02Y+YSzKGbkU74iV4XJAN8uj82ZzE6OmUIZwrVnuz16I9Zf36RdYaQy60NYwBN
	FXOfHb0CxplAZk7jqot9IhtAWX
X-Google-Smtp-Source: AGHT+IEE78/Z4cM54I5476Wy34bV159gP+0N0Tvwfh+K0r7mh/ttMVRg09Ta4qk/l3xojWZ5G8TZvQ==
X-Received: by 2002:a05:7301:1a2:b0:2ae:6118:dbce with SMTP id 5a478bee46e88-2b17d249f21mr10346565eec.10.1768252947438;
        Mon, 12 Jan 2026 13:22:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a53cdsm16491675eec.11.2026.01.12.13.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 13:22:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 13:22:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: mp2925: add vid offset for vid mode
Message-ID: <6bcaf61a-5490-4797-8f5e-cea9b1024335@roeck-us.net>
References: <20260106061348.170509-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106061348.170509-1-wenswang@yeah.net>

On Tue, Jan 06, 2026 at 02:13:48PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> In vid mode, the mp2925 vout telemetry has 49 vid step offset, add
> vid offset for this.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied.

Thanks,
Guenter
