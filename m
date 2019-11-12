Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7BFC43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 22:30:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4260E20674
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 22:30:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="G/zaCkV2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfKLWan (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Nov 2019 17:30:43 -0500
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:55918 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726970AbfKLWam (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 17:30:42 -0500
Received: from pps.filterd (m0118789.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xACMP4ZC012601;
        Tue, 12 Nov 2019 17:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id; s=pps-02182019;
 bh=eEQTrTMMbS5NoNM6CgW5d8TOeshnHJx90PFARo1pLGU=;
 b=G/zaCkV2Vvd6QDri3bED4yD9Pfh2Pqfw1kxIpIbn7YstyZDKZk+xuhjtM/E08O2aF3bO
 xYZJEBfe3ghe6RotZ0oin4SCIQgH+HY9qVtZTkrx2TqiSGTJb7ylTYg1A/NRIgQoyHQh
 sF7xKjyirIbwH2kN/a43xrRUCTrMfiLZqBoVK2TE/t09pXTejy/1k+a2u0hded17zAIv
 m2KROyMS19U9fsbMtnW/hJWqFIZQaGc1p2PvhJ7yb8jVt2EfyHyWTANINrxrJOLrtAp+
 FbQKspsm4zpnF9TKd28kguZzLoo8vddvaK+9PgrKji5DsvwAYV245ciWYxW3NSlv7YLm 3A== 
Received: from pp-smtp-01.acuitylightinggroup.com ([192.234.69.190])
        by mx0a-002ab301.pphosted.com with ESMTP id 2w5q5c3wav-1;
        Tue, 12 Nov 2019 17:28:56 -0500
Received: from pps.filterd (pp-smtp-01.acuitylightinggroup.com [127.0.0.1])
        by pp-smtp-01.acuitylightinggroup.com (8.16.0.27/8.16.0.27) with SMTP id xACMQm8M020048;
        Tue, 12 Nov 2019 17:28:56 -0500
Received: from inf-dsk-207.acuitylightinggroup.com (inf-dsk-207.acuitylightinggroup.com [10.59.79.18])
        by pp-smtp-01.acuitylightinggroup.com with ESMTP id 2w5uadrkkm-1;
        Tue, 12 Nov 2019 17:28:56 -0500
From:   Eric Tremblay <etremblay@distech-controls.com>
To:     linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        corbet@lwn.net
Subject: [PATCH v8 0/2] hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.
Date:   Tue, 12 Nov 2019 17:29:59 -0500
Message-Id: <20191112223001.20844-1-etremblay@distech-controls.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Reason: safe
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Version eight of the driver for Texas Instruments TMP512/513 sensors.

Thanks for the review

Main changes from version 7:
	- Report the shunt value as current instead of voltage
	- Refactor the way we get the right chip register
	- Adjust visibility of current and power depending on
	  shunt resistor value
	- Fix example in bindings
	- Use uint32-array instead of uint8-array for nFactor values

Main changes from version 6:
	- Add tmp513 to index.rst
	- Use microvolt instead of volt for bus voltage range
	- Fix current value interpretation
	- Wrap dt-bindings lines to 80 characters

Main changes from version 5:
	- Use shunt-resistor-micro-ohms standard property
	- Fix alignment between 'enum' and 'default' in dt-bindings

Main changes from version 4:
	- Remove config_lock mutex
	- Rewrite dt-bindings in yaml

Main changes from version 3:
	- Remove tmp51x_config structure, there was no useful static
	  field in the structure. The data was moved to tmp51x_data
	  structure.
	- Remove platform data
	- use device_ API instead of of_device API
	- Use array for n-Factor values.
	- Set shunt default value to 1000 uOhms

Main changes from version 2:
	- Remove the neccessity to provide a shunt-resistor value
	- Remove max-expected-current-ma configuration and always
	  use max possible current for calibration
	- Make sure calculation during calibration can't overflow
	- Add value clamping for DT value and runtime parameters
	- Support non DT system
	- Move hysteresis from DT to standard attribute

Main changes from version 1:
	- Use the with_info API instead of sysfs attributes.
	- Remove non-standard attributes and raw value.
	- Move settings that were non-standard attributes to
	  device tree, update documentation as well.
	- Fix coding style issues

Eric Tremblay (2):
  dt-bindings: hwmon: Add TMP512/513
  hwmon: Add driver for Texas Instruments TMP512/513 sensor chips.

 .../devicetree/bindings/hwmon/ti,tmp513.yaml  |  93 +++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/tmp513.rst                | 103 +++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tmp513.c                        | 772 ++++++++++++++++++
 7 files changed, 987 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
 create mode 100644 Documentation/hwmon/tmp513.rst
 create mode 100644 drivers/hwmon/tmp513.c

-- 
2.17.1

