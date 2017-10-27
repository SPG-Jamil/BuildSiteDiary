<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdatePanelProgress.ascx.cs" Inherits="BSD.User_Control.UpdatePanelProgress" %>
<style>
    .spinner {
        font-size: 45px;
        height: 90px;
        margin: 11px auto;
        text-align: center;
        width: 100%;
        z-index: 999999999;
    }

        .spinner > div {
            -webkit-animation: sk-stretchdelay 1.2s infinite ease-in-out;
            -moz-animation: sk-stretchdelay 1.2s infinite ease-in-out;
            -ms-animation: sk-stretchdelay 1.2s infinite ease-in-out;
            -o-animation: sk-stretchdelay 1.2s infinite ease-in-out;
            animation: sk-stretchdelay 1.2s infinite ease-in-out;
            background-color: #1699dd;
            display: inline-block;
            height: 100%;
            width: 6px;
        }

        .spinner .rect2 {
            -webkit-animation-delay: -1.1s;
            -moz-animation-delay: -1.1s;
            -ms-animation-delay: -1.1s;
            -o-animation-delay: -1.1s;
            animation-delay: -1.1s;
        }

        .spinner .rect3 {
            -webkit-animation-delay: -1.0s;
            -moz-animation-delay: -1.0s;
            -ms-animation-delay: -1.0s;
            -o-animation-delay: -1.0s;
            animation-delay: -1.0s;
        }

        .spinner .rect4 {
            -webkit-animation-delay: -0.9s;
            -moz-animation-delay: -0.9s;
            -ms-animation-delay: -0.9s;
            -o-animation-delay: -0.9s;
            animation-delay: -0.9s;
        }

        .spinner .rect5 {
            -webkit-animation-delay: -0.8s;
            -moz-animation-delay: -0.8s;
            -ms-animation-delay: -0.8s;
            -o-animation-delay: -0.8s;
            animation-delay: -0.8s;
        }

    @-webkit-keyframes sk-stretchdelay {
        0%, 40%, 100% {
            -webkit-transform: scaleY(0.4);
            -moz-transform: scaleY(0.4);
            -ms-transform: scaleY(0.4);
            -o-transform: scaleY(0.4);
            transform: scaleY(0.4);
        }

        20% {
            -webkit-transform: scaleY(1.0);
            -moz-transform: scaleY(1.0);
            -ms-transform: scaleY(1.0);
            -o-transform: scaleY(1.0);
            transform: scaleY(1.0);
        }
    }

    @-moz-keyframes sk-stretchdelay {
        0%, 40%, 100% {
            -webkit-transform: scaleY(0.4);
            -moz-transform: scaleY(0.4);
            -ms-transform: scaleY(0.4);
            -o-transform: scaleY(0.4);
            transform: scaleY(0.4);
        }

        20% {
            -webkit-transform: scaleY(1.0);
            -moz-transform: scaleY(1.0);
            -ms-transform: scaleY(1.0);
            -o-transform: scaleY(1.0);
            transform: scaleY(1.0);
        }
    }

    @keyframes sk-stretchdelay {
        0%, 40%, 100% {
            -webkit-transform: scaleY(0.4);
            -moz-transform: scaleY(0.4);
            -ms-transform: scaleY(0.4);
            -o-transform: scaleY(0.4);
            transform: scaleY(0.4);
        }

        20% {
            -webkit-transform: scaleY(1.0);
            -moz-transform: scaleY(1.0);
            -ms-transform: scaleY(1.0);
            -o-transform: scaleY(1.0);
            transform: scaleY(1.0);
        }
    }
</style>
<div class="spinner">
    <div class="rect1"></div>
    <div class="rect2"></div>
    <div class="rect3"></div>
    <div class="rect4"></div>
    <div class="rect5"></div>
</div>
