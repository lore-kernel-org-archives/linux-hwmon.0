Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD9B22F1E
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Feb 2024 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707299480; cv=none; b=mfMcbr/vN+HH/1hnQrX5XCgyb+KBeutb9DW+E/oR6KcA7Ny5KM6ybGtd6I2YqSHK/XkieWDcr32UJ2qkRgH9G3SqQ/a0cqycwOH7aQuXT+jJmuwLbScI/OpiETdDwTYofE3i4dOlcASi+Mp8zxgRK4z2YB4fVlitg2HpHfoLabU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707299480; c=relaxed/simple;
	bh=CY39pNC0uCsaBQzb94/GGl3XL+o+BnmsBVY/zZeCy6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qdPjRI0ZRGftnWTXJCSD8Qg8XANv4gXQRpT4LmqjJKYqdNSYRmXW0utiJA5c2Vd0qif0Atm0Gx+1aUVIMmtrxNt42lZFXekfXoJGDim1OPi2MZiy/p0VFX+xrmqYgSEuaLY39d9VUxpweSukFTkxVgAr3gFmvfExTkU1U7bmP6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ews9Uq3l; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ews9Uq3l"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d073b54359so5588731fa.0
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Feb 2024 01:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707299476; x=1707904276; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dtFbau5jK5Gr2Y0cfe9W70g3mc4Y/UwSliGKOS0syzk=;
        b=ews9Uq3l2noENMan8+hfQzVgfDs9AXgxG1Nw1bBuozqmMCn+zrPAKveWW/NOCj9lNP
         jlymQLMvkPbPIW2u0Z4+G2FWRP2e2biKKQtpZ+1hTTAzAZKVkqHIiha+3q8Q0N4A/+eY
         1pluIR42zODWAAjkZKiQGvcDzuNXSgyylnwDVgZJxgYhbu0IyMgifzLuCP42KwuDPI2A
         TfJ79aErs1m1J9h0gUlSXd29XLZo0rU7+sX8Nubp1X7w/DvcBi/3ACHv9glNb9ilV0BM
         /mpVDfPw2Xv2B78sPLqtPZJ/h4iAg0cUBMZZ0PonXJEseuTs+iOI9HsDV2kSPbVytMj8
         /LHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707299476; x=1707904276;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dtFbau5jK5Gr2Y0cfe9W70g3mc4Y/UwSliGKOS0syzk=;
        b=VyrusI2VBSAY1pcUBd8J6Dg4BWlL6IN48CBoZBvf7J9AlFKJ+48u/UoIxMGtpYLkiZ
         QVl6vW5avUtnUX9VxJSVoqvAueQNH0CjPRL3GLfihdu6sLgAs2PRvxbMVLNVY18pvtSG
         t7nt8/CJ76DMzuDcUyJbnohQLbxKp2TH+nNGntTU4qq2Kk1VFuiCOnhH2uPRiMatKEmV
         xsh+iZSdQ1CfWsHr37K/hp2UwLgioOeBnUHVYYns5mjwOA0jPiVK+61EtrU1riamQeA4
         ylpmtMoGj6zZiFJDwF7UOdzV+WCqC0DeWp+aOOCacDsbuwXyRCGYsFC12M5FoXnZt0Z4
         mNFQ==
X-Gm-Message-State: AOJu0Yw+ySUpNWYVKESOk6yw//FBSU8XzWaIOgQD6e3bzNv5b2bXlOfy
	bBFeXSv7i/n9uKk9JegMya+0T1v9bHEOar3t7lMyWenAyGoJ8ggEcJx9fAwDIw8=
X-Google-Smtp-Source: AGHT+IFs3NbkymJhsIQs20jZKPVS9itujuxCf8+5mENEngBCNcgrRkcEdXXy0dgsS5vXySqMeog6Ew==
X-Received: by 2002:a2e:868a:0:b0:2d0:b644:57ba with SMTP id l10-20020a2e868a000000b002d0b64457bamr3416035lji.35.1707299475908;
        Wed, 07 Feb 2024 01:51:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1YsEDIzbOI6PXF184fqndhK7e9MKryNOlh4s3XNt8qufSnIAxugCcTSu89fOAZX6yUVN6jPwWTgrcpmkRHD8NBzPVKlGOIj4=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id j12-20020aa7c40c000000b005609619be04sm484582edq.41.2024.02.07.01.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 01:51:15 -0800 (PST)
Date: Wed, 7 Feb 2024 12:51:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: javier.carrasco.cruz@gmail.com
Cc: linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: Add support for Amphenol ChipCap 2
Message-ID: <c61a90ff-7f63-4181-96fd-ca5a5029386d@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Javier Carrasco,

The patch 33c41faa98f3: "hwmon: Add support for Amphenol ChipCap 2"
from Jan 30, 2024 (linux-next), leads to the following Smatch static
checker warning:

drivers/hwmon/chipcap2.c:327 cc2_get_reg_val() error: uninitialized symbol 'reg_val'.
drivers/hwmon/chipcap2.c:695 cc2_request_alarm_irqs() error: uninitialized symbol 'ret'.

drivers/hwmon/chipcap2.c
    669 static int cc2_request_alarm_irqs(struct cc2_data *data, struct device *dev)
    670 {
    671         int ret;

Set this to ret = -ENODEV?

    672 
    673         data->irq_low = fwnode_irq_get_byname(dev_fwnode(dev), "low");
    674         if (data->irq_low > 0) {
    675                 ret = devm_request_threaded_irq(dev, data->irq_low, NULL,
    676                                                 cc2_low_interrupt,
    677                                                 IRQF_ONESHOT |
    678                                                 IRQF_TRIGGER_RISING,
    679                                                 dev_name(dev), data);
    680                 if (!ret)
    681                         data->rh_alarm.low_alarm_visible = true;
    682         }
    683 
    684         data->irq_high = fwnode_irq_get_byname(dev_fwnode(dev), "high");
    685         if (data->irq_high > 0) {
    686                 ret = devm_request_threaded_irq(dev, data->irq_high, NULL,
    687                                                 cc2_high_interrupt,
    688                                                 IRQF_ONESHOT |
    689                                                 IRQF_TRIGGER_RISING,
    690                                                 dev_name(dev), data);
    691                 if (!ret)
    692                         data->rh_alarm.high_alarm_visible = true;
    693         }
    694 
--> 695         return ret;
    696 }

regards,
dan carpenter
