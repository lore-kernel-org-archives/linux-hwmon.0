Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2159513CA97
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Jun 2025 16:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749660292; cv=none; b=mtVH/f16sVzb6rxkl+gD6U0lfpziFvq3POheryE/i06S+NxAVM19ccZI1NNuktGcy1toAVtkOV8egqhtkAr8y3GDW0JSvbd6qsDDhncflz3XECMeANcC6FyPVG0Zm43r/KlBaGYgCAOv3xT6iAR0ITDjiJS5Fg6BSK3p6Wijq80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749660292; c=relaxed/simple;
	bh=81CssFKOLbGC+2Cq+G86WYkU485MwC4647iNz6TPqtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIYchPL8+J+kk6PHk01g45QtaeGKVLA7GIbaDgUPufF/UPZceE1Gipg2+LKLe4TraBeEq7YD250QiuLANT2pK+3wmClsXiafFWSwcEIJUKf5G1fSrAIKASUgrymTEmcc//7A68YPwyknvhWCv33tl2N/W5QWqyrd1NAk33aK5+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTTr5uMG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTTr5uMG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235f9ea8d08so97315ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Jun 2025 09:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749660290; x=1750265090; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpv/St+7n/tjxok4zza1rqccslCO//YXEkgVK5hb6TM=;
        b=PTTr5uMGKYn66Nud+z9D7vjpwN2c4TYFXfTaMB4+QHh65t1hlrZn6HTlArnV+AF2jS
         ZEFEVu8RNA/CYouIOrZ8RPmq9Edit0Mko5zYOqLwykYxpGoOAg/DpGo3ev4ugCcCYtCw
         Fq23t92QFkP3kgZ9DDyiOXFTJobeW6/fqId7Cv2I8VR2WsiYWe/FO/oO8myoRD5+aIh8
         8XpYpx9qpeLrYbZBNsKaB1ym5QnM3hCclo3QYuANYykXVrnMcnDuw9fs9Tcju+WxFlPo
         Cq5qrzM4JIpvlRaw7jAp9J4pZQPPyH+3NH1mXJz07UgXY1+yS/5JoYeWZX+YSfdknh3I
         vufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749660290; x=1750265090;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rpv/St+7n/tjxok4zza1rqccslCO//YXEkgVK5hb6TM=;
        b=cMpUnVNbIZbDsSfwN+1tnVwhjlM8w4hJm66alFTktk3i9NJG6+qjFO0Om+eoMP0qAR
         jlb3ZCQm7/UVNUH6xfZG5cngMXzydanXE0pvgcYPozj0I9I0sI9Gk2kGhGFOZN/Y8H2a
         9XIbIbXtiLKhZiCVorUinU6EziZ/3H+Rym75B02sUe1UnVX3odg+uonRU1L6QILmpQVV
         X5mwukGKCyjQ+O5ZUHLutg0o6bB1WchVHMsU8AhGia/O/RHlzgo4kbrzLoApJNDlpRG9
         3uqy2VFMs19vFHZcTApYQ/6GlGv7f1e40QhTMAILHN3umwEqIQIKnsoFwP5Mt5jOa1F+
         tZhQ==
X-Gm-Message-State: AOJu0YxpCw6D79TkiHg/n6NmaOXFr72TtCjyvQ/Zxjn+V46Z2ad60siQ
	sEGBkUlJhM9QmE60JLfbLNDAeZYwaVeIvG57i7jImzeph9okEAhsuTn7hOhvQ0oW
X-Gm-Gg: ASbGncuTYaGGjCdPAgCOMye17zZH6RPkes/hKfwgaA6iH3T/pJqn5e7jYnaDW3/ZmaC
	QJH+MLtcYzDQNSzRVJhphUM03H3kRFiZzPNQHlNqqHsuE7Lx6vEyiwpmTjYguX/an2iwNbu1WPD
	aR1ErEbOuFlIM/xSVdaZGzji7uD+frT1wgpozS68lfRGFeSuph1oTN5eGpw3d0ItnX8wIQRdgSb
	22qFxelNQgXjhCUmlZUbg6NFFYG4rCFfioifTxdXT9zOqmwissM+nBkaPlvau/lzNYte/EiG5Sk
	elcK5PJ428igMfTIRdzt6MR55t5GvDWpw04YREtAiJEHH24TT1p3rt+8S5XTZx9hihyjQbX2oZo
	=
X-Google-Smtp-Source: AGHT+IGXa3g/PGq0+I4LeL2n8xnVeGNrvqOqWQEn/l9nOFTUCgwMTlK4aQ0d1C9Og1LLSS95+swZNw==
X-Received: by 2002:a17:902:dac6:b0:220:ea90:191e with SMTP id d9443c01a7336-23641aa24b9mr58077755ad.4.1749660290293;
        Wed, 11 Jun 2025 09:44:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603406ac5sm90467645ad.176.2025.06.11.09.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:44:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 11 Jun 2025 09:44:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 1/2] hwmon: ltc4282: avoid repeated register write
Message-ID: <1d86974b-d5ae-4a46-8883-670a17e99888@roeck-us.net>
References: <20250611-fix-ltc4282-repetead-write-v1-0-fe46edd08cf1@analog.com>
 <20250611-fix-ltc4282-repetead-write-v1-1-fe46edd08cf1@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611-fix-ltc4282-repetead-write-v1-1-fe46edd08cf1@analog.com>

On Wed, Jun 11, 2025 at 05:26:12PM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The fault enabled bits were being mistankenly enabled twice in case the FW
> property is present. Remove one of the writes.
> 
> Fixes: cbc29538dbf7 ("hwmon: Add driver for LTC4282")
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
