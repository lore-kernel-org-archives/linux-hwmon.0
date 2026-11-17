Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931987;
	b=R6S+ZyfCX/mIhq8YoTs/ZLKWCKTaq8nm4JJf4gvO0uElFEr3KsjHjX6xhzTFVFKO0QKe
	 UG4F//NHISmow0N3CPJ49kf05G6X8g6VuFZetgGRmRPMLyQfr4Xqn0l1ifkKwtV/8T4zE
	 r56VTHOhtdMUpX+m4Hrs16OtvlbD74ZbJGn/ssD9yco/Om3m22YuARKIew6VZ3PpXea+a
	 PtnVpRC+xSzU+AZj53VM+CVJc6AAD9X2yF4iKhvK4fxXflfV4HaV1F1Wa1jXbXcng46l4
	 SF6DecHbm7TzryoyiRxNgQl6QM5Fv2Dk9oj3e3o/GiIXzpYv4prNSpCbTe/dn1l2a3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931987;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=5ayC2chEOMy/EM6FwLYUtO9+bIoqCIH2XBi7kXa8WKU=;
	b=oAvflxWhnMfNencLRkoTYTdGNXDeoGIPo/UTI4eTr7aGrqOhPeIOMaBU826DieMQc5g8
	 68zbEyV3DrnWbIk7tVZrUSKJzWdJ7AHWnCpqtjAQx7td++wOJwzWmguImowZpUmVeLRHD
	 xIRvyDnNdgnaCzKmOd1rVRWS5agNeJScQB89vGDb2FPG55Xafbf2+g+CPCBiAb/snZJ19
	 I6ppR8UJIqCv88l4nLKZEh+o/i14x77dw556zsek0OhMf4jpMmzXDXknByd1OaAE3VlQd
	 sWYyGUnkDcA9hsLi8Tfg6Iy/eFLAXHwi1pCA35UTAMH4y1DBxQJklB1POpM9Dl+LiaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=fdlx1UaH;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F21606A334
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 16:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86F21606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=fdlx1UaH
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id TGDnxnPXOOOJnTLntxHq46; Tue, 17 Nov 2026 16:13:05 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TLnsxwd87xmi7TLnsxyeDD; Tue, 17 Nov 2026 16:13:04 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6afc7d11
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=DByj0yF0lLsDYCRfZgAA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5ayC2chEOMy/EM6FwLYUtO9+bIoqCIH2XBi7kXa8WKU=; b=fdlx1UaHo5ymK/MItCFXYQZzNV
	WMk/Beo118erUyYXX1jz4naVDz8FAshs8jBEeJ6g1j1sUL1vYPk3S0Kuch2sm5TpS+Jbsb7UubcrQ
	gmyndv4TRF/XhHULfp+6e1cT+h0KKUfukFweNIlVwQ4tmS+25lLXjCecfQ0XmNY1wciPyFGIdQmZK
	A1dtWCXp/hPAt2iTQaL/qeExbXcM0FzRRNwNuvX7k8auZqs6tfopKj6FizeeyXyPfrrJwx5OwG40N
	Iw1qmVoFNbx42jLrS7tApiudXeLRdfFsDUPYUOUcxke9CGBwkJINpL7c4LaeK8zWYFJCqo0V2fY74
	oJFt0+bQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58132 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTLnr-00000003LwM-3YPP;
	Tue, 17 Nov 2026 21:43:03 +0530
Date: Tue, 17 Nov 2026 08:13:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
Message-ID: <71d115df-0380-4724-8cc1-ca7da0aa5fc4@roeck-us.net>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
 <20261116-marvel-env-v2-6-ef614eb2e7f1@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-marvel-env-v2-6-ef614eb2e7f1@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTLnr-00000003LwM-3YPP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:58132
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJc8BCbLOn+3INHdnIUTRDWflY9HztF1He65sGXtcDQB0wrsgT5yD2jwHIlBjrPJ2YnppSprZR9i2O9gPlOZiH86nf6FOShEyFjUOlu0yjh9ZrYjcyPx
 WrByBwfFei9OUPyjRz8r0djFbmQcZh60vAQIB2Vb82fgUR/yJ4xwyIFEpZBNyKh6R/X5JffQIZA77KEz1ufmNynOOO20VRiLmi95FB355zjxmSU5K+JNRUCf

On Mon, Nov 16, 2026 at 09:59:13PM -0500, Matt Turner wrote:
> The management firmware of the Marvel (EV7) AlphaServers, the GS1280,
> ES80 and ES47, monitors temperatures, fans, voltages and power supplies.
> The SRM console describes each sensor as a packet in a power and
> environment node of its config tree (GCT), and fills in the readings
> when asked to refresh the node. The packet layout was taken from Tru64
> UNIX.
> 
> The firmware gives each temperature, fan and voltage sensor a warning
> limit and a failure limit, and reports the sensor in the warning or
> failure state once its reading reaches one. Neither state means that the
> sensor is broken: a temperature past its failure limit is too high, not
> faulty. Power supplies are either working or failed, with the cause
> (AC, POK, overtemperature, fan) logged by the firmware.
> 
> Export the sensors through hwmon. A temperature's warning and failure
> limits become max and crit, with max_alarm set in either state and
> crit_alarm in the failure state. A fan's warning limit becomes min, with
> min_alarm set in either state and fault in the failure state, which is
> when the firmware counts the fan as failed. A voltage exports its
> reading, with min_alarm or max_alarm set in either state and lcrit_alarm
> or crit_alarm in the failure state, depending on which side of its
> nominal voltage it reads. The console gives the nominal voltage and only
> one other limit, so the voltage limits are not exported. A power supply
> is a voltage channel with only a fault attribute.
> 
> A refresh keeps the boot CPU in the console with interrupts disabled for
> up to 300 ms per node, so refresh a node at most once per
> update_interval. The hwmon core serializes the callbacks, which also
> serializes the refreshes.

This is not how the update_interval is supposed to be used. update_interval
is expected to be programmed into the chip.

Soft intervals should be hard-coded.

Thanks,
Guenter
