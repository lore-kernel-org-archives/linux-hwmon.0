Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wr0-f176.google.com ([209.85.128.176]:35558 "EHLO
        mail-wr0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751453AbdF0MTL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jun 2017 08:19:11 -0400
Received: by mail-wr0-f176.google.com with SMTP id k67so157713753wrc.2
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jun 2017 05:19:10 -0700 (PDT)
Received: from jupiter.localnet (WVS-BR01-41-182-134-55.ipb.na. [41.182.134.55])
        by smtp.gmail.com with ESMTPSA id r5sm1703910wmr.9.2017.06.27.05.19.07
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jun 2017 05:19:08 -0700 (PDT)
From: Rigo Reddig <rigo.reddig@gmail.com>
To: linux-hwmon@vger.kernel.org
Subject: sensor config for (nct6779D) ASRock X370 Gaming K4
Date: Tue, 27 Jun 2017 13:19:04 +0100
Message-ID: <12723808.ig1cY2DeaI@jupiter>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2564039.0a2ZArHxf7"
Content-Transfer-Encoding: 7Bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart2564039.0a2ZArHxf7
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

I recently puzzled out the scalars and inputs for my mainboard and was told to 
submit the config here for others that might find it useful.

These may apply to other nct6779D boards but so far this is purely specific to 
the ASRock X370 Gaming K4.

I have linked to and attached the file.
https://gist.github.com/rigred/000cb8486dfae1972154ec9bf8355ac0


--nextPart2564039.0a2ZArHxf7
Content-Disposition: attachment; filename="ASRock-X370-Gaming-K4"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; name="ASRock-X370-Gaming-K4"

chip "nct6779-isa-0290"

        # Fans
        label fan1 "Chassis Fan 3 Speed"
        label fan2 "CPU Fan 1 Speed"
        label fan3 "CPU Optional Fan Speed"
        label fan4 "Chassis Fan 1 Speed"
        label fan5 "Chassis Fan 2 Speed"

        #Fan minimums
        #set fan2_min 950
        #set fan2_target 30000

        # Temperatures
        label temp1 "Motherboard"
        label temp2 "CPU"
        label temp3 "Auxillary"
        label temp4 "VRM"
        label temp5 "AUXTIN2"
        label temp6 "CPU (PECI)" #Needs scalar sits at -25

        # Voltages

        label in0 "VCore"
        label in1 "VPPM" #scalar
        label in2 "AVCC"
        label in3 "3VCC"
        label in4 "+12V" #scalar
        label in5 "VDDCR_SOC"
        label in6 "DRAM"
        label in7 "3VSB"
        label in8 "VBat"
        label in9 "Null"
        label in10 "VIIN10"
        label in11 "Chipset 1.05V"
        label in12 "+5V" #scalar
        label in13 "VDDP"
        label in14 "1.8V+"

        # Compute Inputs
        # The nct6779D uses a 2.048V input range, all inputs above that are scaled using a voltage divider.
        # Specific inputs like the ADC, AVCC, VBAT, 3VSB and 3VCC utilize an integrated voltage divider 
        #
        # values as per nuvoton nct6779D datasheet
        # Section 8.5 Analog Inputs (Page 54,55)
        # #       Vs     R1,Rin   R2,Rf    Vin
        # in4  +12.0     56       10     ~+1.84
        # in12  +5.0     20       10     ~+1.67
        #
        compute in1 @*2, @/2
        compute in4 ((56/10)+1)*@, @/((56/10)+1)
        compute in12 ((20/10)+1)*@, @/((20/10)+1)

--nextPart2564039.0a2ZArHxf7--

