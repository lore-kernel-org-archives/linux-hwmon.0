Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A5640963A
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185908; cv=pass; b=eeToR4aLqBXntEv+clsJz0r1Dxa1/XWn1aXZRCXxSxRvTsKQ23IGhw3N3BwMbrWKcJ03OwdO9RsVv+orIpPzMG6CjWmzOdIuvCcoR70kbAcKwSHHgqHKYelhCGNA3ujFxXf/eBAxzKM/JDJTYHDD12iOvsveaIh1gmfiQrTFe/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185908; c=relaxed/simple;
	bh=5ebukEa9X8TLK1zNOHZXcjEycVHzAZwRNrrqasYyvKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQ26JhdotxsKHrSLs7GIEz6GqhfvDIOmcIDS5Uy98HEadKw4pf+ghE6V9TydM0w6DdvTx8VEopDwCAxmJof6roN+X+tR/mb8lBLEzzvL/Xnrsk5ZEipWd2nAXo/w8Io6h79gIpOjXpmby6gCvMmJ40KKeCAEttmf+Dz7NxuU0Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLsbyPBN; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLsbyPBN"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbee846deecso4741373a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 07:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788185907; cv=none;
        d=google.com; s=arc-20260327;
        b=dGoEqRakCkUpDhhDapJGXw3r5g1R99Pg9/sfZrZztAf6+GxH3E3W2+lHo/LPpvYNle
         oPXYAiwZjcznHmXPKrRJXrd8dlXHXalFStsOH/amOVS/Ph4h3JHClqGRdXK3Ze52yKQO
         McMhs2ahl9hN+YRQQmuhjuz2nYkOdq6W0GxGAv2PN/VvPKUi1TA/tjot9hbiiESIlv2R
         aq+oVjY3V25Sohh3r9ZnFVKmZVCxMo4Xjw7LsbQoeWADLPm+R9gUZ+Rx+HyYuh3+4R76
         YGTEayk90psNTw5Umw7TpcZZdRpZx9lYEyI4WO+SQgtmjV4nxLweg4QkV9nGSVeFmqp0
         ALXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1ZOG88pTRBHH6b+RUYSoXdM5pS/61VuSbKJS1GDc7CU=;
        fh=i55rMgIGHUGUzaCfHBRgbvAdxDRFcaS9HfObAXct0kU=;
        b=baehn33G6b959xsv4nHF2Qsbqcz3SDqn1mFaV7TQI+IsZzBxV3UY+QC2RUWcDoom0x
         8ur6Bc5mWL0XXoeE13eACiJitM/8NrNwCgnrKENcMqRhowe6U6ygFvdBympOapsi0SjP
         TOzx1qsAmpEfoSaEJuneW4m2f8GnIlGoNvtSZt7+UBNm1k/JTp5ALHcGaKTbeL2Az6/Q
         WZpuvYau79Mv3o710GGMYtlwDUPZDia7jpU6VJqhtdg0PlHcO6i2yvtfzdV7YySQqmQe
         RLr53+Be3cagEjEf2caywHm7Xu2cfcDnDq4WhLmahU2VPJ/7AwH9Ht2idDuVYieRtcQ9
         5png==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788185907; x=1788790707; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZOG88pTRBHH6b+RUYSoXdM5pS/61VuSbKJS1GDc7CU=;
        b=aLsbyPBNeRqQU+KBefDS/iiNA3A19Xk+Xh8XWWtQvI/pc9k6E1UCvlvtakSXMb6xDu
         /QemWCiuVO7Ah5lhhz5W1nafLXNxph3PLxyiQ625k8TpZbnhlWmEMMBBOoeNXcWj4HP6
         /HOp2J60b00LgeB829rcXk0xTB4jnmq9pUPS0o5GqWwGrTyXKWIMw+a9DD0QkJDYZUEW
         CSQRJNDyx4FlTyCw9fyshHbiwKjDvM3NS+DoyRz1UPV1WISs2HLyAJ2W62KASgBTbvjZ
         I03aPYozG7IGRoY42zetGY3T7m2zAe1jNfSir6RHj12Jd1O/XE+mjMEQBydrk99ioBLe
         HMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185907; x=1788790707;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1ZOG88pTRBHH6b+RUYSoXdM5pS/61VuSbKJS1GDc7CU=;
        b=TdovyssD865+IdGmMU7SJzNKhkV+kho7dWlpo/iYctP+EyHwnIxSeV4e9HEiiL0Ewr
         4isRhNn2k/gM+hzab5NdOXA6pT2NYvtJ5FsHyqiH67q7vUMiVAJgmbdIFDUMOWjTF82J
         7NHMDZTaa77kHubZlQt0GwxqeH5ZlVygro69hI1RuBXABRnWTS8LpoYf00nq2EoMK8gE
         UzqQhLrUQR7g5JqBRd93QVmH4e8G3rhgohmMyZbC/Wi9RLvzYPzJl4oc5cq1HyTgeTJo
         vnSr3DJhYjeA8qvIhmqInsLVKV8RSOP2et0BEjHbn086iqWFS2/bhV1vGBtB6gnHkmJj
         euvw==
X-Forwarded-Encrypted: i=1; AHgh+RpkxaqMusSD37iW+5mT6cjG++MMGlfn5H+7+RJLZv2isWdfjIkiOpJpvsrzU8c+AwxVgdxtz6huFYsJ6A==@vger.kernel.org
X-Gm-Message-State: AFuF++nwtl0npuRQ54NLZ0QNrDmrOwIgyce3bDr5cHrmouqMaO9901sk
	U2VtrTMs64l86JKJD9RzHU9GLdXrGDZOq4yO4IicRgwwPrUY0Epq6kD+cvTZqYPhBBhvJMZuY9r
	4etFJHGNRPDKFLSKV5PyYCOp4zJFJCGNdnVM/
X-Gm-Gg: AR+sD12Mo0SF+ixzZuskrKsf3HPHSR0mIJBbCov9yD82HU2+nJzwFAg2/2rjpnaUZna
	tx1wApieNeEw56RIUiJnkiSX/vVb7Ti3Hf4kN4RnF/GDHGtv8fR3qYnBxh4TRrd3BT7p97Whifp
	dnJ2PwhvncqkRwn9SRe4Z3q52mcGeeBVErR1+7kuvXfcbI3gusW+lik3GNnngHsw0q5clYBAzLW
	59Ua0hRea/KxtJvnDjRwoaXvoTiEYKvyZX6retQ76/O2JhOP45eXx96wp5EddtyjKpFu6k8J3jR
	3lehCm5pCw8vnYOYHGhYtb0XxVfrSC3MxzON27Ej10ne/YGyGH5LydHhL5KHEbdbyASQ+puTu/u
	9KL56tLqvsg==
X-Received: by 2002:a05:6a21:339c:b0:3c3:64cb:9b99 with SMTP id
 adf61e73a8af0-3d265a3df5amr37173569637.6.1788185906618; Mon, 31 Aug 2026
 07:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-asus-x670e-a-hwmon-fix-v1-1-cf0a680ccbe2@sne.moe>
In-Reply-To: <20260830-asus-x670e-a-hwmon-fix-v1-1-cf0a680ccbe2@sne.moe>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 31 Aug 2026 16:18:14 +0200
X-Gm-Features: AcwNN1Xm-dHdx5qoEWmx-mK7azvrCKK8tNYI9QQLi_Q61e2CGu-085AeqI9F8U8
Message-ID: <CAB95QASxkb0sFxBSSY5PA3QJQEs04rBaKke7Oh9fGo1-asyE4A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX X670E-A GAMING WIFI
To: sugar@sne.moe
Cc: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sun, 30 Aug 2026 at 15:03, Asai Neko via B4 Relay
<devnull+sugar.sne.moe@kernel.org> wrote:

> +static const struct ec_board_info board_info_strix_x670e_a_gaming_wifi = {
> +       .sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
> +               SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
> +       .mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
> +       .family = family_amd_600_series,
> +};

The board_info_strix_x670e_a_gaming_wifi struct does not seem to
differ from board_info_strix_x670e_e_gaming_wifi just below. Please
reference the existing one in the DMI_EXACT_MATCH_ASUS_BOARD_NAME().

Thank you,
Eugene
