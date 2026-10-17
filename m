Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B71637EFE3
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Oct 2026 04:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211060; cv=pass; b=GSiWC0IYVsBrmbWydNvVTuBOI6lLB3FaESyZh/I8H2Sg4YNQez34gDeXQuCon7oaFtvQoJm/IHBhmrEecmbEK2LN6cn+4UdimxQ9h3tSD07/sb8T3g6hSGrw02ztWyYwBwAPuWkk+4DwCC1yA8v1jlNEAQojczGFxABjYulst0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211060; c=relaxed/simple;
	bh=1oRJgE0/OpJYlTlzynaBwOuxLl8TXrQObIb4bOmb95g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=G3nvHpUWJDtNiaZlloy8U6d37/wVqDpvQQU1eAuj+dQgndiW+XtikxTyNNSIuO/0zmSPHfkAgQrOJPVAUbb1Z98MsecGAkLTLwn4mD4oOz7F1SKLRP4px6u2u6kPtDXf9s6qa3yGLj8goCy471EKLdlBamccA8n08YwusDruWeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N933h72A; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N933h72A"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a9e5838f09so2605071fa.1
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 21:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792211056; cv=none;
        d=google.com; s=arc-20260327;
        b=lcRaOVYZ1WJge+sVTZAdEvRvo/99UZ08mWuz0a5jH8PIJfn62l4ka53+fHSVmDCBkA
         heS+krR6AyPh1MwI7waQyMO2tMvgqfqisn/Dz6z6G4j45Yf6uf17lanZMEBTx/YPoeJA
         lKGacNuPwFZtKaCBCfBwl93hmVdwmwd1TbLXKUC1C18oMbq3aq7ZCEdrJAvoOdQC3Bbd
         PWEwCft5vZLu4OpMfTlulNIpfv0XqUfUE4WeXmC+ZKkqokh1YF5ry/PldNA8nIwwR+nk
         ighQbESXNP2ALHoYlY5b1xKzRz2QB5GFk81ndnDwsBMG4tdwIG9L6prOrixjwuLxt76d
         xV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Pk8KkEEG59veQ4YrCFinnmzhounrCAj7LNBdzBMoOzw=;
        fh=KpZJX0iMHGMttG19AyeEzF+fNwzq946ZCq0iyz+GP6I=;
        b=kMHdyFL7+tKLew/6IOwY/nbF9j/wvUMXgKIOzyO6vk1QYNr4wKPXEfenh3yLgigmSY
         gcZG3ue1+tfLtBaI13xpPszYcw+bmgifYNY34OQV025Fh8nLwkTvdo0O1OTuEtIDmvpy
         gLL9GJWPCOsBUfAJjnqXLmCA6qF4NzAujM176ELIq01CaFfrPpWFoirURANBP+e8Uq9Y
         qyTspoiJ5vXVJA8G+zuY/2dMJkOk8/wzroyue5RXy4ZjLi5hhMqHTCUA5yXo/kkG9nus
         feSJgzbwmx7OqD1QW++WqU89MAMvk6veffLT1fj+HWyK15nI/UME8CLjn7zmCT3yKCuR
         YWAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792211056; x=1792815856; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pk8KkEEG59veQ4YrCFinnmzhounrCAj7LNBdzBMoOzw=;
        b=N933h72AZKE7rkG6iYbR3ciiuOMAlVcD4Jx5qL/WzLwNMTZu3SkNSnCCCFfVGmBnnq
         LGJEuDsv6EJwIO/rkUE4t9ILlk4Aj9fqLOiGjURbFj7HCaGFVU1iTFBKWJUu/wBhcJFh
         4gA4xIY0el94pcG34/+NLLp5Ki99PduL2kHnHE9PEC9GgEta95kHs9kA93+wdyDgooLe
         zAqvjpZw/FhnHSj2N33+FiXAwPVb3iSLHag/K9KiXjHlK4kgyakmTIfcxI7Dv70pQC7Y
         D+Ug01gyuhpz08zKEyj9TlC45Ch4ah9Z79lKAhZhkOuCKyjpcv0yuKZkYUHe3GvrrVt6
         kHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211056; x=1792815856;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pk8KkEEG59veQ4YrCFinnmzhounrCAj7LNBdzBMoOzw=;
        b=1B/Eodgd2hZ7z/M9ozBchh0FoqUGekupQ8br4Q6PDiVvuLip8UuPlnldzJwrCeqRGd
         ZiIhKMzlRrGfD/hStvuW02XTaaZTXemlyERecRRErxr3jqxlEPMOm34GV/YBWfq2XWto
         PdAVm+GYnYdapbfOm/xIC8EBX7kdQIIHyFsY/y/AQWfXFp8/RQzUhV/Q7c35VA1PMv74
         uGYOh9YLodb7YH6GWuVL/NXu05vYnIIyLUbkL5a28hwRLbo0rixShnigEcx6Oq+MXvbv
         A1fr8Tj3irQFYdCK5XwXG0fT4MCzkAM9R+x9Yv2MnmduDKvtNjaNIwnM20elPyU7Mv3h
         pq3w==
X-Gm-Message-State: AFq9FYJVzkuFCeDnp1bbRS0jULPEOETLngEQmlfJROTM+hUngOHNOgAY
	u1R1H1Ddk8SoSq+QlyQUysOw4uzZ4Vkx0wpcJiEo1ygnN5MKO8Rj/Usw+coE/vtTnV1/S3d1FVH
	bQx9w0nwlW1pdtGIUvdf9zsIhzV3jZ05jOFWs16o=
X-Gm-Gg: AYBFou011G3Rnmaw2hHwe2fG6qL0dBSvsval0pBtee9Jhm4Lm7qrQVSsaUe3+MZrl9e
	azEQzpXrH6Hmp4j+7GeKVsLN3+31YJcamunGcJUAE7BWT+zwXklyMATQERQXF2Q6PeW3TWsychn
	MN4CUzpDkld6VLWBI4c3DHy73e5l5xkyCIZA1NI/HdeoUAW0gXOc4SDVD2XDDFv6KuQ9uAV8cCz
	E5kdCcVKVtOlqx1KCN8Pe/iiZ3zgNPjkS1sa7qmgvRC847pNeepV1jaJCZnwIvUzkD/piOPmj44
	aKD+gjbTRlSixGCgvUTsoHe33NI1ZhHsAYTDVEStwhbqzcmsMqFzT7EegJ44XH7kZA==
X-Received: by 2002:a05:651c:144c:b0:3a9:d22d:a793 with SMTP id
 38308e7fff4ca-3ab292e4e8cmr3912141fa.23.1792211056363; Fri, 16 Oct 2026
 21:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Martin <martinvancoden@gmail.com>
Date: Sat, 17 Oct 2026 00:24:03 -0400
X-Gm-Features: AclHuK9bX8NU4txV_Z7YjChy3oMvwP40sA7eu6_QCX1ihFdfiDd-RSZNBs5uLGk
Message-ID: <CAB+4TXvUg==zX4nh=KKTZdpW7khYCHVUzaPkBdjrQ2NT5MahBA@mail.gmail.com>
Subject: [PATCH] hwmon: (asus-ec-sensors) expose T_Sensor (alt1) on ROG STRIX
 B650E-I GAMING WIFI
To: linux-hwmon@vger.kernel.org
Cc: eugene.shalygin@gmail.com
Content-Type: text/plain; charset="UTF-8"

hwmon: (asus-ec-sensors) expose T_Sensor (alt1) on ROG STRIX B650E-I GAMING WIFI

On the ROG STRIX B650E-I GAMING WIFI the inlet probe plugged into the board's
Thermal Sensor header is served by the EC's alternate T_Sensor register (0x37,
"T_Sensor alt1" in the AMD 600-series family map). The board's .sensors mask
only enables the primary 0x36 "T_Sensor", which reads a constant 0.0 degC on
this board, so the probe is currently invisible to the in-tree driver.

Add SENSOR_TEMP_T_SENSOR_ALT1 to the board's mask so 0x37 is exposed as a
hwmon temperature channel. Because ec_sensor_temp_t_sensor_alt1 is already a
member of environment_temp_sensors, the read path returns -ENODATA when no
probe is connected, so boards without a water-cooling loop are unaffected.

Verified on a ROG STRIX B650E-I GAMING WIFI (BIOS 38.54) running a custom
water-cooling loop: register 0x37 tracks the coolant temperature with the
expected slow thermal time constant (steadily rising under sustained GPU
load) and is clearly distinct from the 0x32 board-ambient sensor, matching
the behavior of a loop inlet probe.

Signed-off-by: Martin <martinvancoden@gmail.com>


diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index e43645e..c4cc0f3 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -683,6 +683,7 @@ static const struct ec_board_info
board_info_strix_b650e_e_gaming = {

 static const struct ec_board_info board_info_strix_b650e_i_gaming = {
  .sensors = SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR |
+ SENSOR_TEMP_T_SENSOR_ALT1 |
  SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_IN_CPU_CORE,
  .mutex_path = ACPI_GLOBAL_LOCK_PSEUDO_PATH,
  .family = family_amd_600_series,
