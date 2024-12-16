Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A73A205E11
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Dec 2024 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734369700; cv=none; b=rLsD+aW60zUwesVr62UIM4DJVPG4wvKlqVt+Lu8eSdnnXf2VVnQ/+2gNAe7l7tdmJ5WGZ0Hd5CAO5myFl2THvxViTeT/fdlnsZn155kFKmZ97DogE9x22D1uzMGYEOjtC44Fg1HF7ILK7F0BNRBIrmURBZSKBmN2wJdwUGWZQz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734369700; c=relaxed/simple;
	bh=UaiheyCYXQ3B71gzgRszsy0LUzGLiYECP34vTeeQDkM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=adNinCb9l2a44+tBx2hxjsFH/S3NXx9bcp8H/FQrJMvnUMgEwWHw7QXHPTqbNwze4qfJO51DKU2k90K1H4yav6XeDvXqKu0JoWtIbRQcbCaeuMRRFCXioP44DhQ6lb852504ONc/ubzzXA0hNcibhjJ6Dz6FV4PFhdG6oMP4pZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwxP3rE1; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwxP3rE1"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3f249f3b2so6161659a12.3
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Dec 2024 09:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734369697; x=1734974497; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UaiheyCYXQ3B71gzgRszsy0LUzGLiYECP34vTeeQDkM=;
        b=kwxP3rE1RC35rZJehoPmGwDOIzVzr8DQP2Bb0JLWgKtDNxxmDoqfhCJuAL/ty/lSzM
         lyFVxpHSdZGqeaTl99diNycAc/f2nDiw0B5JJWgYJQK3yOUUl8s7q5PbbG/Rsw89Lcx2
         1hhGoQtYKRkc3jAMTnoymQrlSR8vCmXJv7S6wOaybGs97Vt6KSOvtMEsU+H4CLuv/a6+
         KmaoN0ezxDhkcpVaZFdMKWXGgtg3nobX8QIVi4Hh7XW8VUwlX/qXqxjlCVRG1Dbkz/Kg
         XRC6n7OeXZT2dWIIkUyD98f3DS32Uj2cC26gqLgD83+WJZy7Zqge+gPnYjHWJhF6rb5g
         tC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734369697; x=1734974497;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaiheyCYXQ3B71gzgRszsy0LUzGLiYECP34vTeeQDkM=;
        b=U2+NEBW/719qHKLytkmUQPmSoTtyonqi7SX5qa+mK63yn2zVVko3M61qEqZjroZ221
         oYaU1KV/MDLKuush3nb9Q4s8ATTaJfz0zuGtod4zgx11tJDtnbuVJrTYZQCsS7HvjRRh
         m705F0pVhI/LnxuhgwgwKSYSGyDDG9xXLA5PDMWDQirlckMB+VgYlHp2w9aAuCt0iyOK
         JGM0+K89E5rCuoUajOR3ovGcKXE8gvCAyt9dLOmCWW+aUxyFA/eY+0lMsGHQXW516RUv
         OYvUaMR8ntTDl/59XAF9D3oQCKoS4BSyunMqVcfCjWhXFYQezvyww3nkkK3XwsV5UQgQ
         BR4w==
X-Gm-Message-State: AOJu0YzEmoYXNSOqEcd84QS6wDEyY+/YMMzXDe8jZE0bbq+w6zK4muuD
	TRKXd6kqeYWh7n/JQrrXe2FTraSOOkOk+DUqzrP59YytHvXApwL9zwzCOL7EOKrEsrwRsj/ilA8
	vVx517neRhKXG/nAnEzRnRaTPRvpUic0=
X-Gm-Gg: ASbGncs5hiTaayVPQMC+z2obceJafvGmMHL2GShdxisfi4XXNqY013xMyWFErfdgutK
	b0UzfRqVaiKHLjAf3VVVWLNxe4clL+QVhkmm9W/UtNsQ2eHqlW8wen/pipuPUurV3AZQ=
X-Google-Smtp-Source: AGHT+IHKXexCPM6L4FtGcEvMvX75Op2AJ4r1HtT2W0GnP38OfMENxX6ha45Wr2RXLweKJ/vQ6glxaWEW28ftL594ajU=
X-Received: by 2002:a05:6402:40cf:b0:5d3:ba42:e9fa with SMTP id
 4fb4d7f45d1cf-5d63c3405a8mr28592858a12.16.1734369697484; Mon, 16 Dec 2024
 09:21:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: fiona galla <fiona.ga92@gmail.com>
Date: Mon, 16 Dec 2024 18:21:26 +0100
Message-ID: <CALeoAQygKXoM4_Pq_5QDSaFWMK=Au-E5VOrp1UpdX3j_ucs2Hg@mail.gmail.com>
Subject: Issue with Accessing All Temperatures on EMC1438 with emc1403 Driver
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am currently working with an EMC1438 temperature sensor using the
`emc1403` driver.
However, I am facing an issue where only 3 temperature sensors are
being detected, while the sensor should report 8.
Here is the Device Tree entry I=E2=80=99m currently using:

emc1438@4c { reg =3D <0x4c>; compatible =3D "microchip,emc1403"; };

Could you help me understand if there is any specific configuration or
modification needed in the Device Tree to ensure that all 8
temperatures are accessible?

Thank you for your assistance.

Best regards
